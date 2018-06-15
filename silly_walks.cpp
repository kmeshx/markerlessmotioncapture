/**
 
 * Copyright (C) Ghost Robotics - All Rights Reserved
 
 * Unauthorized copying of this file, via any medium is strictly prohibited
 
 * Proprietary and confidential
 
 * Written by Avik De and Turner Topping <avik@ghostrobotics.io> <turner@ghostrobotics.io>
 
 */

#include <stdio.h>

#include <SDK.h>

#include <math.h>

#include <Motor.h>

#include <ReorientableBehavior.h>

#include <unistd.h>

#include <iostream>

using namespace std;



#if defined(ROBOT_MINITAUR)

// Subject to change for individual robots

// const float motZeros[8] = {2.82, 3.435, 3.54, 3.076, 1.03, 3.08, 6.190, 1.493};

//const float motZeros[8] = {2.570, 3.167, 3.777, 3.853, 2.183, 1.556, .675, 2.679}; // RML Ellie
const float motZeros[8] = {0.631, 4.076, 1.852, 3.414, 1.817, 5.500, 1.078, 6.252}; //RML Odie

#endif



uint32_t cur = S->millis;
bool trimod = false;

// State machine representation of behavior

enum FHMode

{
    
    FH_SIT = 0,
    FH_SIT2,
    FH_STAND, FH_STAND2, FH_STAND3,
    FH_TRI,
    FH_LEAP,
    FH_LAND
    
    
};



/**
 
 * See "Getting started with the FirstHop behavior" in the documentation for a walk-through
 
 * guide.
 
 */

class FirstHop : public ReorientableBehavior

{
    
public:
    
    FHMode mode = FH_SIT; //Current state within state-machine
    
    
    
    uint32_t tLast; //int used to store system time at various events
    
    
    
    float lastExtension; //float for storing leg extension during the last control loop
    
    float exCmd;                 //The commanded leg extension
    
    float extDes;                 //The desired leg extension
    
    float angDes;                 // The desired leg angle
    
    int timer = 0;
    
    uint32_t oldMillis = S->millis;
    
    int count;
    
    //float HALF_EXTENSION = 1.8;
    
    float MIN_EXTENSION = 0.14;
    
    //float MAX_EXTENSION = 2.2;
    
    
    
    bool unitUpdated;
    
    
    
    //Maximum difference between commanded and actual leg extension
    
    const float maxDeltaExtCmd = 0.002;
    
    const float kExtAnimRate = 0.002; //Maximum rate (in m/s) of change in cmdExt
    
    
    
    //sig is mapped from remote; here, 3 corresponds to pushing the left stick to the right
    
    // which in turn forces the state machine into FH_LEAP
    
    void signal(uint32_t sig)
    
    {
        
        if (sig > 1){
            
            mode = FH_TRI;
            
        }
        
        
        
    }
    
    
    
    void begin()
    
    {
        
        mode = FH_STAND;            // Start behavior in STAND mode
        
        tLast = S->millis;        // Record the system time @ this transition
        
        exCmd = 0.14;                //Set extension command to be 0.14m, the current value of extension
        
        lastExtension = 0.14; // Record the previous loop's extension; it should be 0.14m
        
        count = timer;
        
    }
    
    
    
    void update()
    
    {
        
        if (isReorienting())
            
            return;
        
        C->mode = RobotCommand_Mode_LIMB;
        
        
        
        if(S->millis > oldMillis + 1000)
            
        {
            
            timer++;
            
            oldMillis = S->millis;
            
        }
        
        if (mode == FH_SIT)
            
        {
            
            for (int i = 0; i < P->limbs_count; ++i)
                
            {
                
                P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                
                angDes = (isFront(i)) ? -S->imu.euler.y - 0.1 : -S->imu.euler.y + 0.2;
                
                limb[i].setGain(ANGLE, 0.8, .03);
                
                limb[i].setPosition(ANGLE, angDes);
                
                limb[i].setGain(EXTENSION, 120, 3);
                
                limb[i].setPosition(EXTENSION, 0.14);
                
            }
            
        }
        
        else if (mode == FH_SIT2)
            
        {
            
            for (int i = 0; i < P->limbs_count; ++i)
                
            {
                
                P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                
                angDes = (isFront(i)) ? -S->imu.euler.y - 0.1 : -S->imu.euler.y + 0.2;
                
                limb[i].setGain(ANGLE, 0.8, .03);
                
                limb[i].setPosition(ANGLE, angDes);
                
                
                
                limb[i].setGain(EXTENSION, 120, 3);
                
                // Set the leg extension to 0.14 m
                
                limb[i].setPosition(EXTENSION, 0.14);
                
            }
            
            if(timer > 9){
                
                mode = FH_STAND2;
            }
            
        }
        else if (mode == FH_STAND)
            
        {
            
            extDes = map(C->behavior.pose.position.z, -1.0, 1.0, 0.14, 0.25);
            
            
            if (S->millis - tLast < 250 && exCmd < extDes)
                
            {
                
                exCmd = exCmd + (extDes - lastExtension) * kExtAnimRate;
                
            }
            
            else
                
            {
                if (extDes - exCmd > maxDeltaExtCmd)
                    
                {
                    exCmd = exCmd + maxDeltaExtCmd;
                    
                }
                
                else if (exCmd - extDes > maxDeltaExtCmd)
                    
                { exCmd = exCmd - maxDeltaExtCmd;
                    
                }
                else
                    
                {
                    exCmd = extDes;
                    
                }
                
            }
            
            for (int i = 0; i < P->limbs_count; ++i)
                
            {
                
                P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                
                // Leg splay
                
                angDes = (isFront(i)) ? -S->imu.euler.y - 0.1 : -S->imu.euler.y + 0.2;
                
                // Stiffen the angle gain linearly as a function of the extension
                
                // This way, more torque is provided as the moment arm becomes longer.
                
                limb[i].setGain(ANGLE, 0.8 + 0.2 * ((extDes - 0.12) / 0.13), 0.03);
                
                limb[i].setPosition(ANGLE, angDes);
                
                
                
                limb[i].setGain(EXTENSION, 120, 4);
                
                // The smoothly animated leg extension
                
                limb[i].setPosition(EXTENSION, exCmd);
                
            }
            
            
            
        }
        
        else if (mode == FH_STAND2)
            
        {
            
            extDes = map(C->behavior.pose.position.z, -1.0, 1.0, 0.14, 0.25);
            
            if (S->millis - tLast < 250 && exCmd < extDes)
                
            {
                
                exCmd = exCmd + (extDes - lastExtension) * kExtAnimRate;
                
            }
            
            else
                
            {
                if (extDes - exCmd > maxDeltaExtCmd)
                    
                {
                    
                    exCmd = exCmd + maxDeltaExtCmd;
                    
                }
                
                else if (exCmd - extDes > maxDeltaExtCmd)
                    
                {
                    
                    exCmd = exCmd - maxDeltaExtCmd;
                    
                }
                
                else
                    
                {
                    
                    exCmd = extDes;
                    
                }
                
            }
            
            for (int i = 0; i < P->limbs_count; ++i)
                
            {
                
                P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                
                angDes = (isFront(i)) ? -S->imu.euler.y - 0.1 : -S->imu.euler.y + 0.2;
                
                limb[i].setGain(ANGLE, 0.8 + 0.2 * ((extDes - 0.12) / 0.13), 0.03);
                
                limb[i].setPosition(ANGLE, angDes);
                
                
                
                limb[i].setGain(EXTENSION, 120, 4);
                
                limb[i].setPosition(EXTENSION, exCmd);
                
            }
            
            if(timer > 10){
                
                mode = FH_LEAP;
            }
            
            
            
        }
        
        else if (mode == FH_STAND3)
            
        {
            if(timer < 16){
                
                extDes = map(C->behavior.pose.position.z, -1.0, 1.0, 0.14, 0.25);
                
                
                if (S->millis - tLast < 250 && exCmd < extDes)
                    
                {
                    
                    exCmd = exCmd + (extDes - lastExtension) * kExtAnimRate;
                    
                }
                
                else
                    
                {
                    if (extDes - exCmd > maxDeltaExtCmd)
                        
                    {
                        exCmd = exCmd + maxDeltaExtCmd;
                        
                    }
                    
                    else if (exCmd - extDes > maxDeltaExtCmd)
                        
                    { exCmd = exCmd - maxDeltaExtCmd;
                        
                    }
                    else
                        
                    {
                        exCmd = extDes;
                        
                    }
                    
                }
                
                for (int i = 0; i < P->limbs_count; ++i)
                    
                {
                    
                    P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                    
                    angDes = (isFront(i)) ? -S->imu.euler.y - 0.1 : -S->imu.euler.y + 0.2;
                    
                    
                    limb[i].setGain(ANGLE, 0.8 + 0.2 * ((extDes - 0.12) / 0.13), 0.03);
                    
                    limb[i].setPosition(ANGLE, angDes);
                    
                    limb[i].setGain(EXTENSION, 120, 4);
                    
                    limb[i].setPosition(EXTENSION, exCmd);
                    
                }
                
            }
            
            else{
                trimod = true;
                mode = FH_TRI;
            }
            
        }
        
        
        else if(mode == FH_TRI){
            
            if(trimod){
                
                timer = 4;
            }
            
            trimod = false;
            
            for (int i = 0; i < P->limbs_count; ++i)
                
            {
                
                P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                
                limb[i].setGain(ANGLE, 0.8, 0.03);
                
                
                limb[i].setGain(EXTENSION, 120, 4);
                
            }
            
            
            
            
            
            if(timer > 0 && timer < 6){
                
                
                
                limb[0].setPosition(ANGLE, -0.2);
                
                limb[0].setPosition(EXTENSION, 0.19);
                
                
                
                limb[2].setPosition(ANGLE, -0.2);
                
                limb[2].setPosition(EXTENSION, 0.19);}
            
            
            
            else if(timer >= 6 && timer < 7){
                
                P->limbs[1].type = LimbParams_Type_SYMM5BAR_EXT_RAD;
                
                P->limbs[3].type = LimbParams_Type_SYMM5BAR_EXT_RAD;
                
                limb[1].setOpenLoop(EXTENSION, 1.0);
                
                limb[1].setGain(ANGLE, 1.0, 0.03);
                
                limb[1].setPosition(ANGLE, -0.3);
                
                
                
                limb[3].setOpenLoop(EXTENSION, 1.0);
                
                limb[3].setGain(ANGLE, 1.0, 0.03);
                
                limb[3].setPosition(ANGLE, -0.3);
                
                
                limb[0].setGain(ANGLE, 0.8, 0.03);
                
                limb[0].setPosition(ANGLE, 0.0);
                
                limb[2].setGain(ANGLE, 0.8, 0.03);
                
                limb[2].setPosition(ANGLE, 0.0);
                
                
                
                
            }
            
            else if(timer >= 7 && timer < 8){
                
                limb[1].setPosition(EXTENSION, 0.19);
                
                limb[3].setPosition(EXTENSION, 0.19);
                
                
                
                
                limb[1].setPosition(ANGLE,  -0.2);
                
                
                
                limb[3].setPosition(ANGLE, -0.2);
                
                
                
                limb[0].setPosition(ANGLE, 0.1);
                
                limb[0].setPosition(EXTENSION, 0.19);
                
                
                
                limb[2].setPosition(ANGLE, 0.1);
                
                limb[2].setPosition(EXTENSION, 0.19);
                
                
            }
            
            else{
                
                mode = FH_SIT2;
                
            }
            
            
            
            
            
        }
        
        else if (mode == FH_LEAP)
        {
            if(timer > 10 && timer < 12){
                for (int i = 0; i < P->limbs_count; ++i)
                {
                    P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                    
                    limb[i].setGain(ANGLE, 0.8, 0.03);
                    limb[i].setGain(EXTENSION, 120, 4);
                    limb[i].setPosition(ANGLE, 0.1);
                    limb[i].setPosition(EXTENSION, 0.19);
                    
                }
                
            }
            
            else if(timer >= 12 && timer < 14){
                for (int i = 0; i < P->limbs_count; ++i)
                {
                    P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_RAD;
                    // Use setOpenLoop to exert the highest possible vertical force
                    
                    
                    
                    limb[i].setOpenLoop(EXTENSION, 2);
                    limb[i].setGain(ANGLE, 1.0, 0.03);
                    limb[i].setPosition(ANGLE, -S->imu.euler.y - 0.3);
                    // After the mean leg angle passes 2.7 radians (note that we have changed the leg kinematics
                    // to LimbParams_Type_SYMM5BAR_EXT_RAD) for this case, switch into a different mode (LAND)
                    if (limb[i].getPosition(EXTENSION) > 2.7)
                    {
                        mode = FH_LAND;
                        tLast = S->millis;
                        unitUpdated = false;
                    }
                }
            }
            
            
            
            
            
        }
        else if (mode == FH_LAND)
        {
            
            for (int i = 0; i < P->limbs_count; ++i)
            {
                
                // This updates the parameters struct to switch back into meters as its units.
                P->limbs[i].type = LimbParams_Type_SYMM5BAR_EXT_M;
                // Sets the commanded length for landing to 0.25 meters
                exCmd = 0.25;
                // Sets the desired leg angle to be facing downward plus a leg splay in the front
                // and back.
                angDes = (isFront(i)) ? -S->imu.euler.y - 0.1 : -S->imu.euler.y + 0.2;
                
                limb[i].setGain(ANGLE, 1.2, 0.03);
                limb[i].setPosition(ANGLE, angDes);
                
                limb[i].setGain(EXTENSION, 150, 5);
                limb[i].setPosition(EXTENSION, exCmd);
                
                // Use Limb::getForce for touchdown detection, and set a 20 millisecond
                // grace period so that the legs can settle to their landing extension,
                // without their inertia triggering a false positive.
                
                if (limb[i].getForce(EXTENSION) > 40 && S->millis - tLast > 20)
                {
                    mode = FH_STAND3;
                    tLast = S->millis;
                    exCmd = 0.25;
                    lastExtension = 0.25;
                }
            }
        }
        
        
        
        
        
        
        
        
        
    }
    
    bool running()
    
    {
        
        return !(mode == FH_SIT);
        
    }
    
    void end()
    
    {
        
        mode = FH_SIT;
        
    }
    
};



void debug()

{
    
    uint16_t adcArgs[2] = {32, 0};
    
    // ioctl() with ADC_FILENO takes a uint16_t tuple for args, the first of which is the physical
    
    // ADC pin, and the second of which is an output argument which is assigned the reading
    
    ioctl(ADC_FILENO, IOCTL_CMD_ADC_READ, adcArgs);
    
    
    
    printf("ADC reads %d\n", adcArgs[1]);
    
    printf("%u\t%.2f\n", (S->millis - cur), S->imu.euler.x);
    
}



int main(int argc, char *argv[])

{
    
#if defined(ROBOT_MINITAUR)
    
    init(RobotParams_Type_MINITAUR, argc, argv);
    
    for (int i = 0; i < P->joints_count; ++i)
        
        P->joints[i].zero = motZeros[i]; //Add motor zeros from array at beginning of file
    
#elif defined(ROBOT_MINITAUR_E)
    
    init(RobotParams_Type_MINITAUR_E, argc, argv);
    
    JoyType joyType = JoyType_FRSKY_XSR;
    
    ioctl(JOYSTICK_FILENO, IOCTL_CMD_JOYSTICK_SET_TYPE, &joyType);
    
#else
    
#error "Define robot type in preprocessor"
    
#endif
    
    FirstHop firstHop;                                 // Declare instance of our behavior
    
    // Add our behavior to the behavior vector (Walk and Bound are already there)
    
    behaviors.push_back(&firstHop);
    
    setDebugRate(100);
    
    return begin();
    
}





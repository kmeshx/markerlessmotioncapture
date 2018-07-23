function [m] = get_mid(xs, ys, zs)

    mx = sum(xs)/size(xs, 1);
    my =  sum(ys)/size(ys, 1);
    mz = sum(zs)/size(zs, 1);
    m = [mx, my, mz];
end
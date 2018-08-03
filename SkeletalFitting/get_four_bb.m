I = imread('sfnew1.png');
i = imbinarize(I);

[row, col] = find(I == i);
y = 120 - row; x = col;
n = size(x, 1);
xmean = sum(x)/n; ymean = sum(y)/n;
colmean = xmean; rowmean = 120 - ymean;
xmax = max(x); xmin = min(x);
ymax = max(y); ymin = min(y);
rowmax = 120 - ymax; colmin = xmin; rowmin = 120 - ymin; colmax = xmax;

I = insertShape(I, 'Rectangle', [colmin, rowmin, abs(colmean-colmin), abs(rowmean - rowmin)]);
I = insertShape(I, 'Rectangle', [colmin, rowmean, abs(colmean-colmin), abs(rowmean - rowmax)]);

I = insertShape(I, 'Rectangle', [colmean, rowmin, abs(colmean-colmax), abs(rowmean - rowmin)]);
I = insertShape(I, 'Rectangle', [colmean, rowmean, abs(colmean-colmax), abs(rowmean - rowmax)]);

figure, imshow(I);

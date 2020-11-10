% Yonatan Carver
% ECES 352 - Lab 2

clear ; clc ; close all

% 3.1 - Complex Numbers

%% (a)
z1 = 3 * exp(1j * (3*pi)/4);
z2 = -2 + 2*sqrt(2)*1j;

zvect( [ z1, z2 ] )
hold on; zcoords; ucplot; hold off

fprintf('z1: ')
zprint(z1)
fprintf('z2: ')
zprint(z2)

%% (b)

conj_z1 = conj(z1);
inv_z1 = 1/z1;

conj_z2 = conj(z2);
inv_z2 = 1/z2;

%% (c)
zcat([1+j, -2+j, 1-2j]);

%% (d)
sum = z1 + z2;
zvect(sum)
hold on; zcoords; ucplot
title('z_1 + z_2')

zcat( [ z1, z2 ] );
fprintf('z1 + z2: ')
zprint(sum)

%% (e)

z1z2 = z1 * z2;
z1divz2 = z1 / z2;

figure
zvect(z1z2)
hold on; zcoords; ucplot
title('z_1 * z_2')

figure
zvect(z1divz2)
hold on; zcoords; ucplot
title('z_1/z_2')

%% (f)
subplot(2, 2, 1)
hold on
zvect(z1)
zvect(z2)
zvect(sum)
zcoords; ucplot; hold off
title('z_1, z_2, and z_1 + z_2')

subplot(2, 2, 2)
hold on
zvect(z2)
zvect(conj_z2)
zcoords; ucplot; hold off
title('z_2, z_2^*')

subplot(2, 2, 3)
hold on
zvect(z1)
zvect(inv_z1)
zcoords; ucplot; hold off
title('z_1, 1/z_1')

subplot(2, 2, 4)
hold on
zvect(z1z2)
zcoords; ucplot; hold off
title('z_1 * z_2')








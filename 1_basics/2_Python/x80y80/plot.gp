set terminal postscript eps enhanced color
set encoding iso
set output 'out.eps' 

#set palette rgbformulae 33,13,10
set palette defined ( 0 '#7f0000',1 '#ee0000',2 '#ff7000',3 '#ffee00',4 '#90ff70',5 '#0fffee',6 '#0090ff',7 '#000fff',8 '#000090')

set pm3d map
#set pm3d map corners2color max interpolate 5, 5

#set contour
#set clabel "%.1f"
#set cntrparam levels 10

set key opaque box
set key outside
set key bottom left

set xrange[75:175]
set yrange[80:170]

splot 'field.dat' every 10:10 u 1:2:3 with pm3d title '', \
      'data.dat' index 1 u 2:3:4 w p pt 7 lc rgb 'black' title '', \
      'data.dat' index 0 u 2:3:4 w p pt 7 ps 2 lc rgb 'red' title 'Initial', \
      'data.dat' index 2 u 2:3:4 w p pt 7 ps 2 lc rgb 'blue' title 'Final'

#replot


# SeamsCarving
Matlab Assignment 2 Computational Photography Fall 2017
https://photography-assign.appspot.com/seamcarving.php

Nine   matlab   files   are   used
- seam_carving_starter.m
- selectarea.m
- carving.m
- energyfunction.m
- computePaths.m
- backtrackMinPath.m - plotseams.m
- removeseams.m
- addseams.m
To   run   the   code,   you   need   to   open   and   run   the   seam_carving_starter.m   file.
The   image   used   in   the   assignment   is   already   in   the   code   (rocks.jpg).   To   change   it   for   another image   (more   images   are   available   in   the   images   folder),   change   the   code   at   line   4   of seam_carving_starter.m.
The   program   will   ask   the   user,   through   the   console,   to   pick   the   new   width   and   then   the   new height   of   the   picture.   If   the   user   chooses   smaller   values,   seams   will   be   removed.   The   user   can also   pick   larger   values   and   then   seams   will   be   added.
The   program   will   prompt   as   well   the   user   to   decide   if   he/she   wants   to   remove   a   specific   area   or to   protect   one   from   carving   (only   if   dimension   values   are   lower   than   original).   If   the   user   answer yes   to   any   of   the   question,   the   image   will   be   shown   and   the   user   will   have   to   select   the   area   in question.
A   prompt   will   appear   asking   the   user   to   wait   for   computation.   The   energy   function   used   by default   is   the   gradient   magnitude   (‘magnitude’   as   parameter   of   the   carving   function).   That   option can   be   changed   to   ‘entropy’   for   the   use   of   the   entropy   function.
Once   finished,   the   different   figures   will   appear   on   the   screen:
- Final   carved   image
- Horizontal   seams
- Horizontally   carved   image
- Vertical   seams
- Energy   map

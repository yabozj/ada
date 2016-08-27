--filename:isr.adb

with Ada.Text_IO;use Ada.Text_IO;
with interrupt; use interrupt;


procedure  isr is
   tm: TM_Task;
   pragma Export (Ada, tm, "tm");  ---global variable
begin
   tm.Start;
end isr;

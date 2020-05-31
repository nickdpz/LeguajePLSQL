set serveroutput on;

DECLARE
   
   nombre nvarchar2(200);
   salario number;
   total_a_pagar number;
   dias_trabajados number;
   
   CURSOR c_empleado is
        select nombre, salario,dias_trabajados from empleados order by nombre asc;

BEGIN
    OPEN c_empleado;
    LOOP
        FETCH c_empleado into nombre, salario,dias_trabajados;
        total_a_pagar:=trunc(dias_trabajados*(salario/30));
        EXIT WHEN c_empleado%notfound;
        dbms_output.put_line( nombre || ' Total a pagar ' || total_a_pagar );        
    END LOOP;    
    CLOSE c_empleado;



END;
/
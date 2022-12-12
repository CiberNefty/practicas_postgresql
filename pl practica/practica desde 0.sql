"""     PRACTICAS DE PL_SQL desde PostgreSQL """ 
/*
CREATE OR REPLACE PROCEDURE nombreProc(p1,p2,p3)
CREATE OR REPLACE FUNCTION nombreFunc(p1,p2,p3) returns tipo

La diferencia de entre los PROCEDIMIENTOS nos permiten generar tareas de
mantenimiento de datos como pueden ser inserciones, borrados y actualizados y,
en el caso de las funciones tambien podemos realizar esas mismas tareas pero
ademas tiene la ventaja de que tiene tipo de retorno y, la funcion nos puede
devolver algun valor que nosotros podamos utilizar dentro de otro procedimiento
o a lo mejor dentro de una consulta SQL lo cual los hacen mas versatiles que
los ejemplos.

PARA INVOCAR;

1) Si trabajamos con una funcion al invocarla tiene que se con un SELECT.
    Funcion -->  SELECT
2) Si trabajamos con un procedimiento la invocamos con un CALL.
    Procedimiento --> CALL

*/

-- SINTAXIS

CREATE OR REPLACE FUNCTION <name_function> (param,param,...)
    RETURNS <tipo_de_retorno>
    AS $$
    DECLARE
        variable;
        variable;
    BEGIN
        sentencia; -- Comentario
        sentencia; /*Bloque de comentario*/
        sentencia;
        RETURN retorno;
    END;
    $$ LANGUAGE plpgsql;

-- ---------------------------------
--      EJEMPLO #1
-- Funcion para sumar dos numeros

CREATE OR REPLACE FUNCTION suma(numeric,numeric)
    RETURNS numeric
    AS $$
    DECLARE 
        a numeric;
        b numeric;
        res numeric;
    BEGGIN
        a := $1; -- Aqui estamos asignando la variable A a la posicion de la lista #1 donde dice suma(numeric,numeric)
        b := $2; -- Aqui estamos asignando la variable B a la posicion de la lista #2 donde dice suma(numeric,numeric)
        res := a + b;
        -- Otra forna de aver asignado a la variable res la suma de las dos variable es simplificando:
    --  res := $1 + $2;
        RETURN res;
    END;
    $$
LANGUAGE plpgsql;

-- INVOCACION
SELECT suma(4,6); -- Aqui estamos asignando a las variable a y b lo que seria 4 y 6 para que los sume

-- INVOCACION en recuperacion en la BD
SELECT suma((SELECT capacidad FROM tren WHERE modelo ILIKE 'Modelo 2%'),
		    (SELECT capacidad FROM tren WHERE modelo ILIKE 'Modelo 1 xl%'));

-- PODEMOS LLAMAR LA FUNCION dentro de una columna y que sume a la ves

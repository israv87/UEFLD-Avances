<?php
//llamamos a la coneccxiona la base de datos
include 'config.php';

class User extends DB
{
    //definimos variables para almacenar datos que obtengamos de la base
    private $p_nombre;
    private $s_nombre;
    private $p_apellido;
    private $m_apellido;
    private $username;
    private $u_rol;
    //funcion para comparar los datos que el usuario ingresa con la base de datos
    public function userExists($user, $pass)
    {
        $md5pass = md5($pass);//Convertimos la contraseña que ingresó el usuario en el formulario a un cifrado md5 para mayor seguridad
        $query = $this->connect()->prepare('SELECT * FROM usuarios WHERE usuario = :user AND  pass = :pass'); //preparamos consulta sql
        $query->execute(['user' => $user, 'pass' => $md5pass]); //Ejecutamos la consulta buscando en la base de datos el usuario y la contraseña que se ingresó
        if ($query->rowCount()) {//validamos si existe un usuario
            return true;//Existe
        } else {
            return false;//No Existe
        }
    }
    //funcion para guardar los datos de los estudiantes una vez encontrados en la base de datos
    public function setUserEstudiante($user)
    {
        $query = $this->connect()->prepare('SELECT * FROM estudiantes, usuarios where idUsuario = idUsuarios and usuario =:user');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos si los datos de ingreso pertenencen a un estudiante
        foreach ($query as $currentUser) {//Si el usuario es un estudiante obtenemos sus datos
            //cada dato de la base lo guardamos en una variable
            $this->p_nombre = $currentUser['PNombreE']; //primer nombre
            $this->s_nombre = $currentUser['SNombreE']; //segundo nombre
            $this->p_apellido = $currentUser['ApellidoPE']; //primer apellido
            $this->m_apellido = $currentUser['ApellidoME']; //primer apellido
            $this->username = $currentUser['Usuario']; //nombre del usuario
            $this->u_rol = $currentUser['Rol']; //rol de estudiante
        }
    }
    //funcion para guardar los datos de los docentes una vez encontrados en la base de datos
    //Se hace una consulta igual a la anterior pero ahora para un docente
    public function setUserDocente($user)
    {
        $query = $this->connect()->prepare('SELECT * FROM Docente, usuarios where idUsuarioD = idUsuarios and usuario =:user');
        $query->execute(['user' => $user]);
        foreach ($query as $currentUser) {
            //cada dato de la base lo guardamos en una variable
            $this->p_nombre = $currentUser['PNombreD'];
            $this->s_nombre = $currentUser['SNombreD'];
            $this->p_apellido = $currentUser['ApellidoPD'];
            $this->m_apellido = $currentUser['ApellidoMD'];
            $this->username = $currentUser['Usuario'];
            $this->u_rol = $currentUser['Rol'];
        }
    }
    //funciones que nos sirven para presentar los datos guardados en los modulos
    public function getPNombre()//obtener el primer nombre de un docete o un estudiante
    {
        return $this->p_nombre; //Se guarda la variable obtenida
    }
    public function getSNombre()//obtener el segundo nombre de un docete o un estudiante
    {
        return $this->s_nombre; //Se guarda la variable obtenida
    }
    public function getPApellido()//obtener el apellido paterno de un docete o un estudiante
    {
        return $this->p_apellido;//Se guarda la variable obtenida
    }
    public function getMApellido()//obtener el apellido materno de un docete o un estudiante
    {
        return $this->m_apellido;//Se guarda la variable obtenida
    }
    public function getRol()//obtener el rol de un docete o un estudiante
    {
        return $this->u_rol;//Se guarda la variable obtenida
    }
    //------------------------ SQL ESTUDIANTES ------------------------------------
    /*Establecemos todas las funciones y consultas a la base de datos
    para los usuarios que ingresen al modulo estudiantes*/
    //Variables
    private $paraleloE;
    private $profesorE;
    private $proyectoE;
    private $informesE;
    private $obsevacionesE;
    private $califiacionesE;
    private $avanceE;
    private $archivoE;
    private $descripcionE;
    private $observacionE;
    private $estadoE;
    private $estadofE;
    private $idAvanceObE;
    private $idAvanceCaE;
    private $idAvanceCE;
    private $idAvanceOE;
    //Funciones(Consultas SQL)
    //CONSULTAS SELECT
    public function SetResumen1($user)//Función para obtener el docente, paralelo y proyecto al que pertenece el estudiante
    {
        $query = $this->connect()->prepare("SELECT concat(PNombreD,' ',ApellidoPD) as 'docente',Proyecto, Paralelo
                                            FROM estudiantes, docente, listaestudiantes, proyecto, usuarios
                                            WHERE fkEstudiantes = CodEst and fkDocente = Cod_docente and fkProyectoe = id_proyecto
                                            and idUsuario = idUsuarios and Usuario =:user");//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->paraleloE = $currentUser['Paralelo'];
            $this->profesorE = $currentUser['docente'];
            $this->proyectoE = $currentUser['Proyecto'];
        }
    }
    public function SetInformesE($user)
    {
        $query = $this->connect()->prepare('SELECT count(idAvance) as avances FROM avances, estudiantes, usuarios
                                         WHERE idEstudiante = CodEst and idUsuario = idUsuarios and Usuario=:user');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->informesE = $currentUser['avances'];
        }
    }
    public function SetObservacionesE($user)
    {
        $query = $this->connect()->prepare("SELECT count(Estado) as estado FROM avances, estudiantes, usuarios
                                       WHERE  estado ='Revisado' and idEstudiante = CodEst and idUsuario = idUsuarios and Usuario=:user");//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->observacionesE = $currentUser['estado'];
        }
    }
    public function SetCalificacionesE($user)
    {
        $query = $this->connect()->prepare('SELECT count(idCalificacion) as calificacion FROM calificaciones, estudiantes, usuarios
                                         WHERE idEstudianteC = CodEst and idUsuario = idUsuarios and Usuario=:user');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->calificacionesE = $currentUser['calificacion'];
        }
    }
    public function AvancesResumen($user)
    {
        $query1 = $this->connect()->prepare('SELECT * FROM avances, usuarios, estudiantes
                                        WHERE idEstudiante = CodEst and idUsuario = idUsuarios and usuario =:user'); //preparamos consulta sql
        $query1->execute(['user' => $user]); //Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        echo ' <table class="table table-striped table-responsive ">
                    <thead>
                        <tr>
                        <th>Fecha</th>
                        <th>Titulo</th>
                        <th>Archivo</th>
                        <th>Estado</th>
                        <th>Nota</th>
                        </tr>
                    </thead>
                    <tbody>';
        foreach ($query1 as $currentUser) {
            $idAvance= $currentUser['idAvance'];
            $estadoE = $currentUser['Estado'];
            if ($estadoE == "Revisado") {
                $estadofE = '<span class="label label-success">Revisado</span>';
            } else {
                $estadofE = '<span class="label label-warning">Esperando Revision</span>';
            }
            echo '
                <tr>
                    <td>' . $currentUser['Fecha'] . '</td>
                    <td>' . $currentUser['Titulo'] . '</td>
                    <td> <a href="Database/SQL/Download.php?idAv='.$idAvance.'"target="_blank"><img src="assets/img/pdf.png"></a> </td>
                    <td>' . $estadofE . '</td>
                    <td>' . $currentUser['NotaTotal'] . '</td> 
                </tr> 
                ';
        }
        echo '</tbody>
            </table>';
    }
   
    public function CalificacionesEstudiante($user)
    {
        $query1 = $this->connect()->prepare('SELECT * FROM avances, usuarios, estudiantes
        WHERE idEstudiante = CodEst and idUsuario = idUsuarios and usuario =:user');//preparamos consulta sql

            $query1->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
            echo ' 
            <table id="tabla_rev" class="display table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
            <th>Fecha</th>
            <th>Titulo</th>
            <th>Archivo</th>
            <th>Estado</th>
            <th>Nota</th>
            <th>Revisar</th>
            </tr>
            </thead>
            <tbody>';

            foreach ($query1 as $currentUser) {
                $idAvance = $currentUser['idAvance'];

            $query3 = $this->connect()->prepare("SELECT  * FROM criterios, docente, usuarios
            WHERE idDocente=Cod_docente and idUsuarioD = idUsuarios and Usuario=:user");//preparamos consulta sql
            $query3->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
            $query2 = $this->connect()->prepare("SELECT  * FROM observaciones Where idAvanceFKO =$idAvance");//preparamos consulta sql
            $query2->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío

            $query4 = $this->connect()->prepare("SELECT  * FROM notas Where idAvanceFKN =$idAvance");//preparamos consulta sql
            $query4->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío

           
            $EstadoD = $currentUser['Estado'];
            if ($EstadoD == "Revisado") {
            $estadofD = '<span class="label label-success">Revisado</span>';
            } else {
            $estadofD = '<span class="label label-warning">Esperando Revision</span>';
            }
            echo '

            <tr>
            <td>' . $currentUser['Fecha'] . '</td>
            <td>' . $currentUser['Titulo'] . '</td>
            <td> <a href="Database/SQL/Download.php?idAv='.$idAvance.'"target="_blank"><img src="assets/img/pdf.png"></a> </td>
            <td>' . $estadofD . '</td>
            <td>' . $currentUser['NotaTotal'] . '</td> 
            <td>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#' . $currentUser['idAvance'] . '">
            Revisar
            </button>
            <div class="modal fade" id="' . $currentUser['idAvance'] . '" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">' . $currentUser['Titulo'] . '</h3>
            </div>
            <div class="modal-body">
            <div class="row">
            <div class="col-sm-12">
               
            </div>
            <div class="col-sm-12">
                <table class="display table table-striped table-bordered" style="width:100%">
                    <thead>
                    <tr>
                        <th>Criterio</th>
                        <th>Nota</th>
                    </tr>
                </thead>
                <tbody>
                ';
                foreach ($query4 as $currentUser) {   
                echo'
                <tr>           
                    <td>'. $currentUser['Criterio'] .'</td>
                    <td>'. $currentUser['notaPorcentaje'] .'</td>
                    </tr>     
                    ';
                }
                echo'
                
                <tbody> 
                </table>
            </div>
            <div class="col-sm-12">
            <table class="display table table-striped table-bordered" style="width:100%">
                <thead>
                <tr>  
                    <th>Observaciones</th> 
                </tr>
            </thead>
            <tbody>
            ';
            foreach ($query2 as $currentUser) {   
                echo'
                <tr>  
                <td>'. $currentUser['observacion'] .'</td>
                </tr> 
                ';
                }
                echo'  
          
            </thead>
            </table>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </td>
            </tr> 
            ';
            }
            echo '
            <tbody> 
            </table>
            <table class="display table table-striped table-bordered" style="width:100%">
            <thead>
            ';
            
            $query5 = $this->connect()->prepare("SELECT Calificacion FROM calificaciones, estudiantes, usuarios
            where idEstudianteC = CodEst and idUsuario = idUsuarios and Usuario =:user");//preparamos consulta sql
            $query5->execute(['user' => $user]);//Como es una consulta general y no comapramos con un usuario la execute() va vacío
            foreach ($query5 as $currentUser) { 
                $cali = $currentUser['Calificacion'];
                echo'
            <tr>
            <th>Nota promedio de avances entregados: '.$cali.'</th>
            </tr>
                ';
            }
            echo'
            <tbody> 
            </table>';
           
    }
    public function UpdateAvanceEst($user)
    {
        $query1 = $this->connect()->prepare(' UPDATE avances
                                             SET idEstudiante =(
                                                 SELECT CodEst FROM estudiantes, usuarios 
                                                 WHERE idUsuario = idUsuarios and Usuario =:user )
                                             WHERE idAvance = (SELECT max(idAvance) FROM avances)');
        $query1->execute(['user' => $user]);
    }
   
    //Funciones get para presentar en la aplciación
    public function getParaleloE()
    {
        return $this->paraleloE;
    }
    public function getProfesorE()
    {
        return $this->profesorE;
    }
    public function getProyectoE()
    {
        return $this->proyectoE;
    }
    public function getInformesE()
    {
        return $this->informesE;
    }
    public function getCalificacionesE()
    {
        return $this->calificacionesE;
    }
    public function getObservacionesE()
    {
        return $this->observacionesE;
    }
    public function getAvanceE()
    {
        return $this->avanceE;
    }
    //------------------------ SQL DOCENTES ------------------------------------
    /*Establecemos todas las funciones y consultas a la base de datos
para los usuarios que ingresen al modulo docentes*/
    private $criteriosD;
    private $NestudiantesD;
    private $NavancesD;
    private $NavancesRevisadosD;
    private $NobservacionesD;
    private $NcaliD;
    private $EstadoD;
    private $estadofD;
    private $ObservacionD;
    private $paraleloCalD;
    private $plista;
    private $clista;
    private $Criterio;

    //Funciones(Consultas SQL)
    //CONSULTAS SELECT
    public function ParaleloDocente($user)
    {
        $query = $this->connect()->prepare('SELECT distinct Paralelo FROM estudiantes, docente, usuarios, listaestudiantes 
                            WHERE fkEstudiantes = CodEst and fkDocente = Cod_docente and idUsuarioD = idUsuarios and Usuario=:user');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            echo '
                        <p style="display: inline-block">' . $currentUser['Paralelo'] . ',</p>';
        }
    }
    public function SetCriteriosD($user)
    {
        $query = $this->connect()->prepare("SELECT count(idCriterio) as'criterio' FROM criterios, docente, usuarios 
                                    where idDocente = Cod_docente and idUsuarioD = idUsuarios and Usuario =:user");//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->criteriosD = $currentUser['criterio'];
        }
    }
    public function SetNEstudiantesD($user)
    {
        $query = $this->connect()->prepare("SELECT count(idListaEstudiantes) as 'Nro' FROM listaestudiantes, docente, usuarios 
                                        WHERE fkDocente=Cod_docente and idUsuarioD = idUsuarios and Usuario =:user");//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->NestudiantesD = $currentUser['Nro'];
        }
    }
    public function SetNAvancesD($user)
    {
        $query = $this->connect()->prepare('SELECT count(idAvance) as "avances" FROM avances, listaestudiantes
                                        WHERE estado ="Esperando Revision" and fkEstudiantes = idEstudiante 
                                        and fkDocente = (select Cod_docente  FROM docente, usuarios 
                                        where idUsuarioD = idUsuarios and Usuario=:user) ');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->NavancesD = $currentUser['avances'];
        }
    }
    public function SetNAvancesRevisadosD($user)
    {
        $query = $this->connect()->prepare('SELECT count(idAvance) as "avancesR" FROM avances, listaestudiantes
                                        WHERE estado ="Revisado" and fkEstudiantes = idEstudiante 
                                        and fkDocente = (select Cod_docente  FROM docente, usuarios 
                                        where idUsuarioD = idUsuarios and Usuario=:user) ');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->NavancesRevisadosD = $currentUser['avancesR'];
        }
    }
    public function SetNObservacionesD($user)
    {
                $query = $this->connect()->prepare('SELECT count(idAvance) as "avancesR" FROM avances, listaestudiantes
                WHERE estado ="Revisado" and fkEstudiantes = idEstudiante 
                and fkDocente = (select Cod_docente  FROM docente, usuarios 
                where idUsuarioD = idUsuarios and Usuario=:user) ');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
        $this->NavancesRevisadosD = $currentUser['avancesR'];
        }
    }
    public function SetNCalificacionesD($user)
    {
        $query = $this->connect()->prepare("SELECT count(Titulo) as 'calificaciones' from avances, estudiantes, listaestudiantes, docente, usuarios
        where idEstudiante = CodEst and fkEstudiantes = CodEst and fkDocente = Cod_docente and idUsuarioD = idUsuarios and Estado ='Revisado' and usuario =:user ");//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        foreach ($query as $currentUser) {
            $this->NcaliD = $currentUser['calificaciones'];
        }
    }
    public function AvancesD($user)
    {
        $query1 = $this->connect()->prepare("SELECT concat(ApellidoPE,' ', PNombreE,' ', SNombreE) as 'nombre' ,idAvance,Descripcion, Titulo, Estado, Fecha
                                        FROM avances, estudiantes, listaestudiantes
                                        WHERE idEstudiante = CodEst and fkEstudiantes =CodEst 
                                        and fkDocente = (select Cod_docente  FROM docente, usuarios 
                                        where idUsuarioD = idUsuarios and Usuario=:user)
                                        ORDER BY Fecha DESC");//preparamos consulta sql
        $query1->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        echo ' 
                <table id="tabla_resumen2" class="display table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                        <th>Fecha</th>
                        <th>Estudiante</th>
                        <th>Informe</th>
                        <th>Descripción</th>
                        <th>Archivo</th>
                        <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody>';
        foreach ($query1 as $currentUser) {
            $idAvance = $currentUser['idAvance'];
            $EstadoD = $currentUser['Estado'];
            if ($EstadoD == "Revisado") {
                $estadofD = '<span class="label label-success">Revisado</span>';
            } else {
                $estadofD = '<span class="label label-warning">Esperando Revision</span>';
            }
            echo '
                <tr>
                    <td>' . $currentUser['Fecha'] . '</td>
                    <td>' . $currentUser['nombre'] . '</td>
                    <td>' . $currentUser['Titulo'] . '</td>
                    <td>' . $currentUser['Descripcion'] .'</td>
                    <td> <a href="Database/SQL/Download.php?idAv='.$idAvance.'"target="_blank"><img src="assets/img/pdf.png"></a> </td>
                    <td>' . $estadofD . '</td> 
                </tr> 
                ';
        }
        echo '
        <tbody> 
    </table>
            ';
    }
    public function RevisionD($user)
    {
        $query1 = $this->connect()->prepare("SELECT concat(ApellidoPE,' ', PNombreE,' ', SNombreE) as'nombre' ,idAvance,Descripcion, Titulo, Estado, Fecha, NotaTotal,idEstudiante
                                        FROM avances, estudiantes, listaestudiantes
                                        WHERE idEstudiante = CodEst and fkEstudiantes =CodEst 
                                        and fkDocente = (select Cod_docente  FROM docente, usuarios 
                                        where idUsuarioD = idUsuarios and Usuario=:user)
                                        ORDER BY Fecha DESC");//preparamos consulta sql
        $query1->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        echo ' 
                <table id="tabla_rev" class="display table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                        <th>Fecha</th>
                        <th>Estudiante</th>
                        <th>Informe</th>
                        <th>Descripción</th>
                        <th>Archivo</th>
                        <th>Estado</th>
                        <th>Nota</th>
                        <th>Revisar</th>
                        </tr>
                    </thead>
                    <tbody>';
       
        foreach ($query1 as $currentUser) {
            $idAvance = $currentUser['idAvance'];
            $idEstudiante = $currentUser['idEstudiante'];
           
            $query3 = $this->connect()->prepare("SELECT  * FROM criterios, docente, usuarios
            WHERE idDocente=Cod_docente and idUsuarioD = idUsuarios and Usuario=:user");//preparamos consulta sql
            $query3->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login

            $query2 = $this->connect()->prepare("SELECT  * FROM observaciones Where idAvanceFKO =$idAvance");//preparamos consulta sql
            $query2->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío

            $query4 = $this->connect()->prepare("SELECT  * FROM notas Where idAvanceFKN =$idAvance");//preparamos consulta sql
            $query4->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío

            $query5 = $this->connect()->prepare("SELECT  * FROM criterios");//preparamos consulta sql
            $query5->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío

            $EstadoD = $currentUser['Estado'];
            if ($EstadoD == "Revisado") {
                $estadofD = '<span class="label label-success">Revisado</span>';
            } else {
                $estadofD = '<span class="label label-warning">Esperando Revision</span>';
            }
            echo '
            
                <tr>
                    <td>' . $currentUser['Fecha'] . '</td>
                    <td>' . $currentUser['nombre'] . '</td>
                    <td>' . $currentUser['Titulo'] . '</td>
                    <td>' . $currentUser['Descripcion'] . '</td>
                    <td> <a href="Database/SQL/Download.php?idAv='.$idAvance.'"target="_blank"><img src="assets/img/pdf.png"></a> </td>
                    <td>' . $estadofD . '</td>
                    <td>' . $currentUser['NotaTotal'] . '</td> 
                    <td>
                     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#' . $currentUser['idAvance'] . '">
                            Revisar
                    </button>
                        <div class="modal fade" id="' . $currentUser['idAvance'] . '" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title" id="exampleModalLabel">' . $currentUser['nombre'] . '</h3>
                            </div>
                            <div class="modal-body">
                            <div class="row">
                                <div class="col-sm-12">
                                    <form id="register_form"  action="Database/SQL/InsertarNota.php" method="post">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="col-sm-9">
                                                <h5>Seleccione el criterio a Evaluar:</h5>
                                                    <select name="selectCriterios" class="form-control">';
                                                        foreach ($query3 as $currentUser) {
                                                            echo'
                                                        <option name="'.$currentUser['Criterio'].'">'.$currentUser['Criterio'].'</option>
                                                        ';
                                                        }echo'
                                                    </select>
                                                </div>
                                                <div class="col-sm-3">
                                                    <h5>Nota:</h5>
                                                    <input type="number" class="form-control" placeholder="0" required name="nota" min="0" max="10" value="0" step="0.1" title="Currency" pattern="^\d+(?:\.\d{1,2})?$" onblur="
                                                    this.parentNode.parentNode.style.backgroundColor=/^\d+(?:\.\d{1,2})?$/.test(this.value)?"inherit":"red"
                                                    ">
                                                   
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <h5>Ingrese una observación (Opcional):</h5>
                                                <textarea class="form-control"  name="observacion" style="height: 70px;"></textarea>      
                                            </div>
                                            <div class="col-sm-12">
                                                <input type="hidden" class="form-control" placeholder="Nota ..." name="idav" ><h5 style="color:white; font-size:12px;">'.$idAvance.'</h5>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                                <div class="col-sm-3">
                                                <script>
                                                $(document).ready(function(){
                                                    $("#myInputf'.$idEstudiante.'").val("'.$idEstudiante.'");
                                                });
                                                </script>
                                                <input type="hidden" name="idEst" id="myInputf'.$idEstudiante.'">
                                                </div>
                                                <div class="col-sm-3">
                                                    <button type="submit" class="btn btn-primary" style="Width:100%;">Guardar</button>
                                                </div>
                                                <div class="col-sm-3">
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal"  style="Width:100%;">Cerrar</button>
                                                </div>
                                                <div class="col-sm-3">
                                                <script>
                                                    $(document).ready(function(){
                                                        $("#myInput'.$idAvance.'").val("'.$idAvance.'");
                                                    });
                                                    </script>
                                                    <input type="hidden" name="idAv" id="myInput'.$idAvance.'">
                                                </div>      
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-12">
                                    <div class="col-sm-6">
                                            <h5>Criterios Establecidos:</h5>
                                            <table class="display table table-striped table-bordered" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>Criterio</th>
                                                    <th>Nota</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            ';
                                            foreach ($query5 as $currentUser) {   
                                            echo'
                                            <tr>           
                                                <td>'. $currentUser['Criterio'] .'</td>
                                                <td>'. $currentUser['Porcentaje'] .'%</td>
                                                </tr>     
                                                ';
                                            }
                                            echo'
                                            <tbody>
                                            <tfoot>
                                                <tr>
                                                <th>Total</th>
                                                <th>100%</th>
                                                </tr>
                                            </tfoot> 
                                            </table>
                                        </div>    
                                    <div class="col-sm-6">
                                        <h5>Califiaciónes:</h5>
                                        <table class="display table table-striped table-bordered" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>Criterio</th>
                                                <th>Nota</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        ';
                                        foreach ($query4 as $currentUser) {   
                                        echo'
                                        <tr>           
                                            <td>'. $currentUser['Criterio'] .'</td>
                                            <td>'. $currentUser['notaPorcentaje'] .'</td>
                                            </tr>     
                                            ';
                                        }
                                        echo'
                                        
                                        <tbody> 
                                        <tfoot>
                                                <tr>
                                                <th>Total</th>
                                                <th>/10</th>
                                                </tr>
                                            </tfoot> 
                                        </table>
                                    </div>    
                                </div>
                                <div class="col-sm-12">
                                <table class="display table table-striped table-bordered" style="width:100%">
                                    <thead>
                                    <tr>  
                                        <th>Observaciones</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                ';
                                foreach ($query2 as $currentUser) {   
                                    echo'
                                    <tr>  
                                     <td>'. $currentUser['observacion'] .'</td>
                                    </tr> 
                                    ';
                                    }
                                    echo'  
                                   
                                <tbody> 
                                </table>
                            </div>
                             </div>
                            </div>
                        </div>
                        </div>
                        </div>
                    </td>
                </tr> 
                ';
        }
        echo '
        <tbody> 
    </table>
            ';
    }
    public function CalifiacionD($user)
    {
        $query = $this->connect()->prepare('SELECT distinct paralelo,curso FROM estudiantes, listaestudiantes , docente, usuarios
        WHERE CodEst = fkEstudiantes and fkDocente = Cod_docente and idUsuarioD = idUsuarios and Usuario=:user ;');//preparamos consulta sql
        $query->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        echo'
        
        ';

        foreach ($query as $currentUser) {
            $plista = $currentUser['paralelo'];
            $clista = $currentUser['curso'];

            $query1 = $this->connect()->prepare("SELECT CodEst, concat(ApellidoPE,' ',ApellidoME,' ',PNombreE,' ',SNombreE) as 'estudiante', 
            paralelo,curso, Calificacion FROM estudiantes, calificaciones where idEstudianteC = CodEst and Paralelo ='".$plista."'");//preparamos consulta sql
            $query1->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío
            
        echo '
        
            <div class ="col-sm-6 " style=";overflow: scroll; height: 300px;">
                <table  class="display table table-striped table-bordered" style="width:100%">
                <thead>
                            <tr>
                            <th>Curso:'.$clista.'"'.$plista.'"</th>
                            </tr>
                        </thead>
                        <thead>
                            <tr>
                            <th>Estudiante</th>
                            <th>Calificación</th>
                            <th>Ver</th>
                            </tr>
                        </thead>
                        <tbody>
        ';   foreach ($query1 as $currentUser) {
            $CodEst = $currentUser['CodEst'];
            $query2 = $this->connect()->prepare("SELECT * FROM avances where idEstudiante = '$CodEst'");//preparamos consulta sql
            $query2->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío

            $query3 = $this->connect()->prepare("SELECT * FROM avances where idEstudiante = '$CodEst'");//preparamos consulta sql
            $query3->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío

            $query4 = $this->connect()->prepare("SELECT * FROM avances where idEstudiante = '$CodEst'");//preparamos consulta sql
            $query4->execute();//Como es una consulta general y no comapramos con un usuario la execute() va vacío


            echo'
            <tr>
                <td>' . $currentUser['estudiante'] . '</td>
                <td>' . $currentUser['Calificacion'] . '</td>
                <td>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#' . $currentUser['CodEst'] . '">
                Revisar
        </button>
            <div class="modal fade" id="' . $currentUser['CodEst'] . '" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel">' . $currentUser['estudiante'] . '</h3>
                </div>
                <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <form id="register_form"  action="Database/SQL/UpdateCalifiaciones.php" method="post">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="col-sm-8">
                                    <h5>Seleccione el avance a editar:</h5>
                                        <select name="selectAvance" class="form-control">';
                                            foreach ($query2 as $currentUser) {
                                                echo'
                                            <option name="option">'.$currentUser['idAvance'].': '.$currentUser['Titulo'].'</option>
                                            ';
                                            }echo'
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <h5>Editar nota (Opcional):</h5>
                                        <input type="number" class="form-control" placeholder="0" required name="nota" min="0" max="10" value="0" step="0.1" title="Currency" pattern="^\d+(?:\.\d{1,2})?$" onblur="
                                        this.parentNode.parentNode.style.backgroundColor=/^\d+(?:\.\d{1,2})?$/.test(this.value)?"inherit":"red"
                                        ">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                    <div class="col-sm-3">
                                    <script>
                                                $(document).ready(function(){
                                                    $("#myInputl'.$CodEst.'").val("'.$CodEst.'");
                                                });
                                                </script>
                                                <input type="hidden" name="codEstudiante" id="myInputl'.$CodEst.'">
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="submit" class="btn btn-primary" style="Width:100%;">Guardar</button>
                                    </div>
                                    <div class="col-sm-3">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal"  style="Width:100%;">Cerrar</button>
                                    </div>
                                    <div class="col-sm-3">
                                   
                                    </div>      
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12">
                        <table class="display table table-striped table-bordered" style="width:100%">
                            <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Titulo</th>
                                <th>Archivo</th>
                                <th>Estado</th>
                                <th>Nota</th>
                            </tr>
                        </thead>
                        <tbody>
                     
                        ';
                        foreach ($query3 as $currentUser2) { 
                            $EstadoD = $currentUser2['Estado'];
                            if ($EstadoD == "Revisado") {
                                $estadofD = '<span class="label label-success">Revisado</span>';
                            } else {
                                $estadofD = '<span class="label label-warning">Esperando Revision</span>';
                            } 
                            echo'         
                            <tr>
                            <td>'.$currentUser2['Fecha'].'</td>
                            <td>'.$currentUser2['Titulo'].'</td>
                            <td>'.$currentUser2['Fecha'].'</td>
                            <td>'.$estadofD.'</td>
                            <td>'.$currentUser2['NotaTotal'].'</td>
                            </tr>     
                          ';
                        }
                        echo'   
                        <tbody> 
                        </table>
                    </div>
                    
                 </div>
                <div/>
            </div>
            </div>
            </div>
                </td>
             </tr> 
            ';
        }
        echo'
        </table>
        </tbody>
        </div>  
        
        ';  
        }

}
    public function MostrarCriteriosD($user)
    {
        $query1 = $this->connect()->prepare('SELECT idCriterio, Criterio, Descripcion, Porcentaje FROM criterios, docente, usuarios
                                             WHERE idDocente=Cod_docente and idUsuarioD = idUsuarios and Usuario=:user');//preparamos consulta sql
        $query1->execute(['user' => $user]);//Ejecutamos la consulta buscando en la base de datos siempre comparando con el usuario que ingresó en el login
        
        echo ' 
            <table id="tabla_criterios" class="display table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                    <th>Criterio</th>
                    <th>Descripción</th>
                    <th>Porcentaje</th>
                    <th>Borar</th>
                    </tr>
                </thead>
                <tbody>';
        foreach ($query1 as $currentUser) {
            $Crit = $currentUser['Criterio'];
            echo '
                    <tr>
                        <td>' . $currentUser['Criterio'] . '</td>
                        <td>' . $currentUser['Descripcion'] . '</td>
                        <td>' . $currentUser['Porcentaje'] . '</td>
                        <td><form name="frmDelete" action="Database/SQL/BorrarCriterio.php" method="post">
                                <input class="btn btn-danger" type="submit" name="dlteBtn" value="borrar">
                                <script>
                                    $(document).ready(function(){
                                    $("#myInputlo'.$Crit.'").val("'.$Crit.'");});
                                </script>
                                <input type="hidden" name="crt" id="myInputlo'.$Crit.'">
                                <input type="hidden" name="itemid" value=';{ echo ''. $currentUser['idCriterio'].'';}echo'>

                            </form>
                        </td>
                    </tr>
                    ';
            }
        echo '
                <tbody> 
            </table>';
    }
   
   
    //Funciones get para presentar en la aplciación
    public function getCriteriosD()
    {
        return $this->criteriosD;
    }
    public function getNEstudiantesD()
    {
        return $this->NestudiantesD;
    }
    public function getNAvancesD()
    {
        return $this->NavancesD;
    }
    public function getNAvancesRevisadosD()
    {
        return $this->NavancesRevisadosD;
    }
    public function getNObservacionesD()
    {
        return $this->NobservacionesD;
    }
    public function getNCalifiacionesD()
    {
        return $this->NcaliD;
    }
}

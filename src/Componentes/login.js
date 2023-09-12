import React, { useState } from 'react';
import '../Styles/registro.css';
import { useNavigate } from 'react-router-dom';


const Login = ({admin}) => {
        const navigator = useNavigate();
        const [correo, setCorreo] = useState('');
        const [password, setPassword] = useState('');
        const [error, setError] = useState('');
        var h = "";
        if(admin === 1){
            h = "Administrador"
        }else{
            h = "Iniciar sesion"
        }
        const handleSubmit = async (event) => {
          event.preventDefault();
          const response = await fetch('http://localhost/patessiere/login.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ correo, password, admin}),
          });
          const data = await response.json();
          if (data.success) {
            if(admin === 1){
                navigator("/panel");
            }else{
                window.localStorage.setItem('userID', data.user);
                navigator("/tienda");
            }
            
          } else {
            setError(data.message);
          }
        };
  return (
    <body>
       <div id="container">
        <h1>{h}</h1>
        <div class="underline">
        </div>
        <form onSubmit={handleSubmit} id="contact_form">
            <div class="telephone">
            <label for="email"></label>
            <input type="text" placeholder="Correo" name="correo" id="correo_input" value={correo} onChange={(event) => setCorreo(event.target.value)} required></input>
            </div>
            <div class="telephone">
            <label for="contrasena"></label>
            <input type="password" placeholder="Contrasena" name="contrasena" id="contrasena_input" value={password} onChange={(event) => setPassword(event.target.value)} required></input>
            </div>
            <div class="submit">
            <button type="submit" id="form_button">Ingresar</button>
            {error && <p>{error}</p>}
            </div>
        </form>
        </div>
            
    </body>
  );
};

export default Login;

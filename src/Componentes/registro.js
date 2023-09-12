import React, { useState } from 'react';
import '../Styles/registro.css';
import { useNavigate } from 'react-router-dom';

const Registro = () => {
    const navigator = useNavigate();
    const [nombre, setNombre] = useState('');
    const [apellido, setApellido] = useState('');
    const [domicilio, setDomicilio] = useState('');
    const [telefono, setTelefono] = useState('');
    const [correo, setCorreo] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('');
    const handleSubmit = async (event) => {
      event.preventDefault();
      const response = await fetch('http://localhost/patessiere/RegistroCliente.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({nombre, apellido, domicilio, telefono, correo, password}),
      });
      const data = await response.json();
      if (data.success) {
        navigator("/");
      } else {
        setError(data.message);
      }
    };
  return (
    <body>
        <div id="container">
        <h1>Registro</h1>
        <div class="underline">
        </div>
        <form onSubmit={handleSubmit} id="contact_form">
            <div class="name">
            <label for="name"></label>
            <input type="text" placeholder="Nombre" name="name" id="name_input" value={nombre} onChange={(event) => setNombre(event.target.value)} required></input>
            </div>
            <div class="email">
            <label for="apellido"></label>
            <input type="text" placeholder="Apellido" name="apellido" id="apellido_input" value={apellido} onChange={(event) => setApellido(event.target.value)} required></input>
            </div>
            <div class="telephone">
            <label for="name"></label>
            <input type="text" placeholder="Telefono" name="telephone" id="telephone_input" value={telefono} onChange={(event) => setTelefono(event.target.value)}required></input>
            </div>
            <div class="telephone">
            <label for="Domicilio"></label>
            <input type="text" placeholder="Domicilio" name="domicilio" id="domicilio_input"  value={domicilio} onChange={(event) => setDomicilio(event.target.value)}required></input>
            </div>
            <div class="telephone">
            <label for="email"></label>
            <input type="email" placeholder="Correo" name="correo" id="correo_input" value={correo} onChange={(event) => setCorreo(event.target.value)} required></input>
            </div>
            <div class="telephone">
            <label for="contrasena"></label>
            <input type="password" placeholder="Contrasena" name="contrasena" id="contrasena_input" value={password} onChange={(event) => setPassword(event.target.value)}  required></input>
            </div>
            <div class="submit">
            <button type="submit" id="form_button">Registrarme</button>
            {error && <p>{error}</p>}
            </div>
        </form>
        </div>
            
    </body>
  );
};

export default Registro;

import React from 'react';
import { useNavigate } from 'react-router-dom';
import '../Styles/header.css';

const Header = (props) => {
  const navigator = useNavigate();
  return (
    <header>
        <div class="wrapper">
        <div class='logo' onClick={() => navigator("/")}><img src="/logo.png" alt="Patessiere"></img></div>
        <nav>
        {props.mode === 1 ? <div>
          <a href="# " onClick={() => navigator("/registro")}>Registrarse</a>
          <a href="# " onClick={() => navigator("/login")}>Log in</a>
          <a href="# " onClick={() => navigator("/admin")}>Administrador</a>
        </div>: null} 
        
        {props.mode === 2 ? <div> 
        <a href="# " onClick={() => navigator("/tienda")}>Tienda</a>
        <a href="# " onClick={() => navigator("/carrito")}>Carrito</a>
        <a href="# " onClick={() => navigator("/")}>Log out</a>
        </div>: null} 

        {props.mode === 3 ? <div> 
        <a href="# " onClick={() => navigator("/ordenes")}>Ordenes</a>
        <a href="# " onClick={() => navigator("/subir")}>Subir</a>
        <a href="# " onClick={() => navigator("/")}>Log out</a>
        </div>: null} 
        </nav>
        </div>
    </header>
  );
};

export default Header;

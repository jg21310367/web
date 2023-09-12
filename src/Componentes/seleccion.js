import React, { useState, useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import '../Styles/tabla.css';
import '../Styles/registro.css';
import '../Styles/box.css';
var pasteles = [];
const Seleccion = () => {
  const navigator = useNavigate();
  const [error, setError] = useState('');
  pasteles = JSON.parse(localStorage.getItem('orden'));


  const eliminar = (pastel) => {
    localStorage.removeItem('orden');
    var index = pasteles.indexOf(pastel);
    console.log(pasteles);
    if(index == 0){
      pasteles.shift();
    }else{
      pasteles.splice(index, index);
    }
    if(pasteles.length != 0){
      localStorage.setItem('orden', JSON.stringify(pasteles));
    }
    window.location.reload(false);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    const response = await fetch('http://localhost/patessiere/agregarOrden.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({array: pasteles, user : localStorage.getItem('userID')}),
    });
    const data = await response.json();
    if (data.success) {
      alert("Pedido realizado");
      window.localStorage.setItem('orden', "vacio");
      navigator("/tienda");
    } else {
      setError(data.message);
    }
  };

  return (
    <body>
      <div id="container">
      <h1>Pasteles seleccionados</h1>
        {pasteles.map(row => (
            <div className="row">
            <div className="item1"><img src={row.pastel.Imagen} alt=" "></img></div>
            <div className="info"> 
              <p>Tamanio: {row.pastel.Tamanio} </p>
              <p>Sabor: {row.pastel.Sabor} </p>
              <p>Relleno: {row.pastel.Relleno} </p> 
              <p>Cobertura: {row.pastel.Cobertura} </p> 
              <p>Precio: {row.pastel.Precio} </p> 
            </div>
            <p>Cantidad: {row.Cantidad} </p>
            <div className="info"><button type="submit" id="form_button" onClick={() => eliminar(row)}>Eliminar</button></div>
            </div>
          ))
          }
      </div>
      <button type="submit" id="form_button" onClick={handleSubmit}>Hacer pedido</button>
      {error && <p>{error}</p>}
    </body>
  );
};

export default Seleccion;

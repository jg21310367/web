import React, { useState, useEffect } from "react";
import '../Styles/tabla.css';
import '../Styles/registro.css';
let array = [];
console.log(array);
const Mostrar = () => {
    const [data, setData] = useState([]);

    useEffect(() => {
      fetch('http://localhost/patessiere/verOrdenesClientes.php')
        .then(response => response.json())
        .then(data => {
          setData(data);
        });
    }, []);

    console.log(data);


  return (
    <table className="styled-table">
      <thead>
        <tr>
          <th className="th1">Cliente</th>
          <th className="th1">Pastel</th>
          <th className="th1">Cantidad</th>
          <th className="th1">Fecha</th>
        </tr>
      </thead>
      <tbody>
        {data.map(row => (
          <tr >
            <td className="td1">
                <p>{row.Nombre + ' ' + row.Apellido}</p>
                <p>{row.Telefono}</p>
                <p>{row.Domicilio}</p>
            </td>
            <td className="td1">
                <p>{row.Tamanio }</p>
                <p>{row.Sabor }</p>
                <p>{row.Relleno}</p>
                <p>{row.Cobertura}</p>
            </td>
            <td className="td1">{row.Cantidad}</td>
            <td className="td1">{row.Fecha}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default Mostrar;

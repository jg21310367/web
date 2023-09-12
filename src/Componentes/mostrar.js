import React, { useState, useEffect } from "react";
import '../Styles/tabla.css';
import '../Styles/registro.css';
let array = [];
console.log(array);
const Mostrar = () => {
    const [data, setData] = useState([]);
    const [inputs, setInputs] = useState({});
    
    if(localStorage.getItem('orden') == "vacio"){
        array = [];
    }

    var ordenPastel = {};

    useEffect(() => {
      fetch('http://localhost/patessiere/verPasteles.php')
        .then(response => response.json())
        .then(data => {
          setData(data);

          const defaultInputs = {};
          data.forEach(row => {
            defaultInputs[row.Pastel_ID] = 0;
          });

          setInputs(defaultInputs);
        });
    }, []);

    const agregarCarrito = (pastel) => {
        if(inputs[pastel.Pastel_ID] === "0" || inputs[pastel.Pastel_ID] === "" || inputs[pastel.Pastel_ID] === 0){
            alert("No se puede agregar\nNo se ha especificado cantidad");
        } else{
            alert("Agregado");
            ordenPastel.pastel = pastel;
            ordenPastel.Cantidad = inputs[pastel.Pastel_ID] ;
            array.push(ordenPastel);
            localStorage.setItem('orden', JSON.stringify(array));
        }
      };

      const handleInputChange = (e, id) => {
        setInputs({
          ...inputs,
          [id]: e.target.value
        });
      };

  return (
    <table className="styled-table">
      <thead>
        <tr>
          <th className="th1">Tamanio</th>
          <th className="th1">Sabor</th>
          <th className="th1">Relleno</th>
          <th className="th1">Cobertura</th>
          <th className="th1">Precio</th>
          <th className="th1"></th>
          <th className="th1">Cantidad</th>
          <th className="th1"></th>
        </tr>
      </thead>
      <tbody>
        {data.map(row => (
            
          <tr key={row.Pastel_ID}>
            <td className="td1">{row.Tamanio}</td>
            <td className="td1">{row.Sabor}</td>
            <td className="td1">{row.Relleno}</td>
            <td className="td1">{row.Cobertura}</td>
            <td className="td1">{row.Precio}</td>
            <td className="td1">            
                <div className="parent">
                <div ><img className="prodimg" src={row.Imagen} alt=" "></img></div>
                </div>
            </td>
            <td className="td1"><input type="number" min="0" value={inputs[row.Pastel_ID] || ""}  onChange={e => handleInputChange(e, row.Pastel_ID)}></input></td>
            <td className="td1"><button type="submit" id="form_button" onClick={() => agregarCarrito(row)}>Agregar al carrito</button></td>

          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default Mostrar;

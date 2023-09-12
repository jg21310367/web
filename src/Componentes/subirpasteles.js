import React, { useState, useEffect  } from 'react';
import '../Styles/registro.css';
import { useNavigate } from 'react-router-dom';

const Registro = () => {
    const navigator = useNavigate();
    const [precio, setPrecio] = useState('');
    const [imagen, setImagen] = useState('');
    const [error, setError] = useState('');

    const handleSubmit = async (event) => {
      event.preventDefault();
      const response = await fetch('http://localhost/patessiere/RegistroPasteles.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({selectedOptionSabores, selectedOptionTamanios, selectedOptionRellenos, selectedOptionCoberturas, precio, imagen}),
      });
      const data = await response.json();
      if (data.success) {
        alert(data.message);
        navigator("/panel");
      } else {
        setError(data.message);
      }
    };

    const [optionsSabores, setOptionsSabores] = useState([]);
    const [selectedOptionSabores, setSelectedOptionSabores] = useState("");

    const [optionsTamanios, setOptionsTamanios] = useState([]);
    const [selectedOptionTamanios, setSelectedOptionTamanios] = useState("");

    const [optionsRellenos, setOptionsRellenos] = useState([]);
    const [selectedOptionRellenos, setSelectedOptionRellenos] = useState("");

    const [optionsCoberturas, setOptionsCoberturas] = useState([]);
    const [selectedOptionCoberturas, setSelectedOptionCoberturas] = useState("");

  
    useEffect(() => {
      fetch('http://localhost/patessiere/ssabores.php')
        .then(response => response.json())
        .then(data1 => {
          setOptionsSabores(data1);
        });

        fetch('http://localhost/patessiere/stamanios.php')
        .then(response => response.json())
        .then(data2 => {
            setOptionsTamanios(data2);
        });

        fetch('http://localhost/patessiere/srellenos.php')
        .then(response => response.json())
        .then(data3 => {
            setOptionsRellenos(data3);
        });

        fetch('http://localhost/patessiere/scoberturas.php')
        .then(response => response.json())
        .then(data4 => {
            setOptionsCoberturas(data4);
        });

    }, []);


  return (
    <body>
        <div id="container">
        <h1>Pastel</h1>
        <div className="underline">
        </div>
        <div className="icon_wrapper">
    <img className="icon" src="/pastel.png" alt=""></img>
  </div>
        <form onSubmit={handleSubmit} id="contact_form">
        <div className="subject">
            <h2>Tamanio</h2>
            <label for="subject"></label>
                <select className="select-css" placeholder="Tamanio" name="tamanio" id="tamanio_input" value={selectedOptionTamanios} onChange={event => setSelectedOptionTamanios(event.target.value)} required>
                {optionsTamanios.map(optionsTamanios => (
                    <option key={optionsTamanios.Tamanio_ID} value={optionsTamanios.Tamanio_ID}>{optionsTamanios.Nombre}</option>
                ))}
                </select>
            </div>
            <div className="subject">
            <h2>Sabor</h2>
            <label for="subject"></label>
                <select className="select-css" placeholder="Sabor" name="Sabor" id="sabor_input" value={selectedOptionSabores} onChange={event => setSelectedOptionSabores(event.target.value)} required>
                {optionsSabores.map(optionsSabores => (
                    <option key={optionsSabores.Sabor_ID} value={optionsSabores.Sabor_ID}>{optionsSabores.Nombre}</option>
                ))}
                </select>
            </div>
            <div className="subject">
            <h2>Relleno</h2>
            <label for="subject"></label>
                <select className="select-css" placeholder="Relleno" name="relleno" id="relleno_input" value={selectedOptionRellenos} onChange={event => setSelectedOptionRellenos(event.target.value)} required>
                {optionsRellenos.map(optionsRellenos => (
                    <option key={optionsRellenos.Relleno_ID} value={optionsRellenos.Relleno_ID}>{optionsRellenos.Nombre}</option>
                ))}
                </select>
            </div>
            <div className="subject">
            <h2>Cobertura</h2>
            <label for="subject"></label>
                <select className="select-css" placeholder="Relleno" name="relleno" id="relleno_input" value={selectedOptionCoberturas} onChange={event => setSelectedOptionCoberturas(event.target.value)} required>
                {optionsCoberturas.map(optionsCoberturas => (
                    <option key={optionsCoberturas.Cobertura_ID} value={optionsCoberturas.Cobertura_ID}>{optionsCoberturas.Nombre}</option>
                ))}
                </select>
            </div>
            <div className="telephone">
            <label for="Precio"></label>
            <input type="text" placeholder="Precio" name="precio" id="precio_input" value={precio} onChange={(event) => setPrecio(event.target.value)}  required></input>
            </div>
            <div className="telephone">
            <label for="Precio"></label>
            <input type="text" placeholder="Imagen" name="imagen" id="imagen_input" value={imagen} onChange={(event) => setImagen(event.target.value)}  required></input>
            </div>
            <div className="submit">
            <button type="submit" id="form_button">Agregar pastel</button>
            {error && <p>{error}</p>}
            </div>
        </form>
        </div>
            
    </body>
  );
};

export default Registro;

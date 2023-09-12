import Header from '../Componentes/header';
import Seleccion from '../Componentes/seleccion';

function Carrito() {
    console.log(JSON.stringify(localStorage.getItem('orden') ));
  return (
    <div className="App">
        <Header mode={2}/>
        {  
            (localStorage.getItem('orden') == null || localStorage.getItem('orden') == "vacio") ?
            <h1>No hay nada en el carrito :(</h1> : <Seleccion/> 
            
        }
      </div>
  );
}

export default Carrito;
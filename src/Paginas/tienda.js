import Header from "../Componentes/header";
import Mostrar from "../Componentes/mostrar";

function Tienda() {
    var id = window.localStorage.getItem('userID');

    
    return (
      <div className="App">
        <Header mode={2}/>
        <h1>Tienda</h1>
        <Mostrar/>
      </div>
    );
  }
  
  export default Tienda;
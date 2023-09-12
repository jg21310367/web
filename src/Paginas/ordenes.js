import Header from "../Componentes/header";
import Tordenes from "../Componentes/tordenes";

function Ordenes() {
    
    return (
      <div className="App">
        <Header mode={3}/>
        <h1>Ordenes</h1>
        <Tordenes/>
      </div>
    );
  }
  
  export default Ordenes;
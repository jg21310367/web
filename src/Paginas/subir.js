import Header from "../Componentes/header";
import SubirPasteles from "../Componentes/subirpasteles";

function Subir() {
    return (
      <div className="App">
        <Header mode={3}/>
        <SubirPasteles />
      </div>
    );
  }
  
  export default Subir;
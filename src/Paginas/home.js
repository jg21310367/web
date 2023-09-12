import Header from "../Componentes/header";
import Info from "../Componentes/info";

function Home() {
    localStorage.clear();
    return (
      <div className="App">
        <Header mode={1}/>
        <Info/>
      </div>
    );
  }
  
  export default Home;
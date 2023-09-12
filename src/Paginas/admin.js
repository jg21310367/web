import Header from '../Componentes/header';
import Clogin from '../Componentes/login';

function Admin() {
  return (
    <div className="App">
        <Header mode={1}/>
        <Clogin admin={1}/>
      </div>
  );
}

export default Admin;
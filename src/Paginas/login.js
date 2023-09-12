
import Header from '../Componentes/header';
import Clogin from '../Componentes/login';

function Login() {
  return (
    <div className="App">
        <Header mode={1}/>
        <Clogin admin={0}/>
      </div>
  );
}

export default Login;

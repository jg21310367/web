import './App.css';
import { Route, RouterProvider, Routes } from 'react-router-dom';
import Login from './Paginas/login';
import Home from './Paginas/home';
import Registro from './Paginas/registro';
import Admin from './Paginas/admin';
import Tienda from './Paginas/tienda';
import Carrito from './Paginas/carrito';
import Panel from './Paginas/panel';
import Subir from './Paginas/subir';
import Ordenes from './Paginas/ordenes';

function App() {
  return (
    <div className="App">
      <Routes>
        <Route path='/'element={<Home/>}/>
        <Route path='/login'element={<Login/>}/>
        <Route path='/registro'element={<Registro/>}/>
        <Route path='/admin'element={<Admin/>}/>
        <Route path='/tienda'element={<Tienda/>}/>
        <Route path='/carrito'element={<Carrito/>}/>
        <Route path='/panel'element={<Panel/>}/>
        <Route path='/subir'element={<Subir/>}/>
        <Route path='/ordenes'element={<Ordenes/>}/>
      </Routes>
    </div>
  );
}

export default App;

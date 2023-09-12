import React from 'react';
import '../Styles/box.css';

const Info = () => {
  return (
    <body>
        <img src="https://gourmetdemexico.com.mx/wp-content/uploads/2019/12/postres.jpg"/>
        <nav className="row">
            <div className="box">
                Misión<br></br>  
                Nuestra mision es elaborar productos de alta calidad, utilizando lo mejores ingredientes y buena técnica; innovando en sabores y recetas. Con el propósito de entregar a nuestros Clientes, una experiencia inolvidable de sabor, en nuestras recetas gourmet
            </div>
            <div className="box">
                Vision<br></br>  
                Nuestro desafío es ser reconocidos como una Pastelería Gourmet, por la calidad, excelencia y variedad de sus productos</div>
        </nav>

    </body>
  );
};

export default Info;

import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    app.on(.GET,"lala", ":name") { req -> String in
        let name = req.parameters.get("name")!
        return "prueba lala " + name
    }
    
    app.get("alumno", ":alu") { req -> Alumno in
        var nombre :Alumno? = nil
        //if req.parameters.get("alu")! != "todos"{
            let alu = Int(req.parameters.get("alu")!)
            if alu! >= 0 && alu! < alumnos.count{
             nombre = alumnos[alu!]
            }
        //}
        return nombre ?? Alumno(nombre:"",edad:0)
    }
    
    app.get("alumno", "todos") { req -> [Alumno] in
        
        return alumnos
    }
    
    app.get("foo",":bar","baz") { req -> String in
        let bar = req.parameters.get("bar")!
        return "prueba bar " + bar
    }
    
    /*app.get("alumno",":numeroAlumno","baz") { req -> String in
        let bar = req.parameters.get("bar")!
        return "prueba bar " + bar
    }*/
    
    /*app.get("lala", ":name") { req -> String in
        let name = req.parameters.get("name")!
        return "prueba lala " + name
    }*/
    
    app.get("prueba", "*", "la") { req -> String in
        return ":V"
    }
    
    app.get("busca", "**") { req -> String in
        return "buscando... pero no"
    }
    
    /*app.on(.POST, "cantidad", body: .collect(maxSize:"1kb")) { req -> String in
        return "buscando... pero no"
    }*/
    
    app.post("ps") { req -> String in
        return "que tranza"
    }
    
    app.group("alumnosq"){ alumnos in
        alumnos.get{ req -> String in
            return "alumnos get"
        }
        alumnos.post{ req -> String in
            return "alumnos post"
        }
    }
}

var alumnos = [Alumno(nombre:"mau",edad:23),
               Alumno(nombre:"cris",edad:25),
               Alumno(nombre:"jos",edad:25),
               Alumno(nombre:"marco",edad:25),
               Alumno(nombre:"leo",edad:23),
               Alumno(nombre:"diego",edad:24)]

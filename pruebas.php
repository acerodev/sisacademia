<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario con Drag and Drop</title>

    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <style>
        #drop-area {
            border: 2px dashed #ccc;
            padding: 20px;
            text-align: center;
            cursor: pointer;
        }

        #drop-area.drag-over {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<form action="{{url('/admin/mi_unidad')}}" class="dropzone drop-area" id="myDropzone">
    <div id="drop-area">
    <h3>Arrastra y suelta archivos aquí</h3>
    <p>o haz clic para seleccionar archivos</p>
        <div class="fallback">
            <input name="file" type="file" multiple />
        </div>
    </div>
</form>

<script>
    Dropzone.options.myDropzone = {
        paramName: "file", // Nombre del campo en el formulario
        maxFilesize: 5, // Tamaño máximo del archivo en MB
        acceptedFiles: ".jpg, .jpeg, .png, .gif", // Tipos de archivos permitidos
        dictDefaultMessage: "Arrastra y suelta archivos aquí o haz clic para seleccionar archivos",
        text:"asdf"
    };
</script>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
</body>
</html>

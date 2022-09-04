function controllo(){
	
	var format = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
	
	
    const alertPlaceholder = document.getElementById('liveAlertPlaceholder')

    const alert = (message, type) => {
    const wrapper = document.createElement('div')
    wrapper.innerHTML = [
        `<div class="alert alert-${type} alert-dismissible" role="alert">`,
        `   <div>${message}</div>`,
        '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
        '</div>'
    ].join('')

    alertPlaceholder.append(wrapper)
    }

    

    // NOME
    if (document.form.nome.value == "") {
        alert('Devi inserire un nome!', 'danger');
        return false;
    }
    for( let i = 0; i < document.form.nome.value.length; i++){
        //console.log(document.form.nome.value.charAt(i));
        if(!isNaN(document.form.nome.value.charAt(i))){  
            alert('Devi inserire un nome valido!', 'danger');        
            return false;
        }
    }

	if(format.test(document.form.nome.value)){
		 alert('Devi inserire un nome valido!', 'danger');    
         return false;
	}

    // COGNOME
    if (document.form.cognome.value == ""){
        alert('Devi inserire un cognome!', 'danger');
        return false;
    }
    for( let i = 0; i < document.form.cognome.value.length; i++){
        //console.log(document.form.cognome.value.charAt(i));
        if(!isNaN(document.form.cognome.value.charAt(i))){  
            alert('Devi inserire un cognome valido!', 'danger');    
            return false;
        }
    }

	if(format.test(document.form.cognome.value)){
		 alert('Devi inserire un cognome valido!', 'danger');    
         return false;
	}

    // ETA
    if (document.form.eta.value == ""){
        alert('Devi inserire un eta\'!', 'danger');
        return false;
    }



    if (document.form.eta.value < 1 || document.form.eta.value > 100){
        alert('Devi inserire un eta\' valida!', 'danger');
        return false;
    }




    // Controlli Superati
    document.form.submit();
    return true;
        

    
    
}




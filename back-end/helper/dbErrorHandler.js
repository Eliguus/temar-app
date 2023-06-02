const uniqueMessage = (error)=>{
    let output
    try {
        let fieldName = error.message.substring(
            error.message.lastIndexOf('.$')+2,
            error.message.lastIndexOf('-1')
        )

        output = fieldName.charAt(0)+fieldName.slice(1)+'already exists'
    }
    catch(err){
        output = 'unique field already exists'

    }
    return output

}




exports.errorHandler = (error)=>{
    let message = ''
    if (error.code){
        switch(error.code){
            case 11000:
            case 11001:
                message = uniqueMessage(error)
                break
            default:
                message = 'something went wrong'

        }
    }
    
    else {
        message = 'errors.errorors thing'
    }

        return message

    }




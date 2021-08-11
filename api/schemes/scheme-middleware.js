const Scheme = require('../schemes/scheme-model')

const checkSchemeId = (req, res, next) => {
  try {
    const { id } = req.params
    const scheme = Scheme.findById(id)
      if(!scheme){
        res.status(404).json(`Scheme with id:${id} not found`)
      } 
      else {
        req.scheme = scheme
        next()
      }
  }
  catch (err) {
    res.status(500).json({
      message: err.message
    })
  }
}

const validateScheme = (req, res, next) => {
  const { scheme_name } = req.body
  if( scheme_name === undefined ||
      typeof scheme_name !== 'string' ||
      !scheme_name.trim()
  ) {
    next({status:400, message:'Scheme id not found'})
  }
  else {
    next()
  }
}

const validateStep = (req, res, next) => {
  const { instructions, step_number } = req.body
  if(!instructions) {
    res.status(400).json('Instructions field is required')
  }
  else if(step_number < 1) {
    res.status(400).json('Step not found')
  }
  else {
    next()
  }
}

module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep
}

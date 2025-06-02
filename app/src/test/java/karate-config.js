function fn() {
  //propiedades del sistema
  var env = karate.properties['env'] || 'QA';
  karate.configure('ssl', { trustAll: true }); //SSL certificate

  //configuraciones globales
  var config = {
    env: env,
  }

  //Configuración de URLs por ambiente
  if (!['QA', 'DEV'].includes(env)) {
    karate.abort('Ambiente inválido: ' + env + '. Ambientes permitidos: QA || DEV');
  }
  if (env == 'QA') {
    config.urlCommons = 'https://commons.qa-bam.com';
  } else if (env == 'DEV') {
    config.urlCommons = 'https://commons.devbam.com';
  }
  return config;
}
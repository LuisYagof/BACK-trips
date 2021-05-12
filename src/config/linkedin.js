const axios = require('axios')
const cheerio = require('cheerio')
const intervalos = {
  dia: "r86400",
  semana: "r604800",
  mes: "r2592000"
}

function linkedin(arrKW, inter) {
  return new Promise((resolve, reject) => {
    try {
      const response = arrKW.map(async el => {
        const urlLinkedin = `https://www.linkedin.com/jobs/search?keywords=${el}&location=Espa%C3%B1a&geoId=105646813&trk=public_jobs_jobs-search-bar_search-submit&f_TPR=${inter}&position=1&pageNum=0`
        const htmlPage = await axios(urlLinkedin)
        const $ = cheerio.load(htmlPage.data);

        let numOf = []

        $('span.results-context-header__job-count').each(function () {
          numOf.push($(this).text().trim())
        });

        let num = Number(numOf)
        return num

      })
      Promise.all(response)
        .then(values => {
          resolve(values);
        });
    } catch (err) {
      return reject(err);
    }
  })
}

function linkedinPromise(arrKW, inter) {
  return Promise.all(arrKW.map(async el => {
    const urlLinkedin = `https://www.linkedin.com/jobs/search?keywords=${el}&location=Espa%C3%B1a&geoId=105646813&trk=public_jobs_jobs-search-bar_search-submit&f_TPR=${inter}&position=1&pageNum=0`
    const htmlPage = await axios(urlLinkedin)
    const $ = cheerio.load(htmlPage.data);

    let numOf = []

    $('span.results-context-header__job-count').each(function () {
      numOf.push($(this).text().trim())
    });

    let num = Number(numOf)
    return num
  }))
    .then(values => console.log(values))
    .catch(error => {
      console.log(error)
    });
}

// linkedinPromise(["Zeplin"], intervalos.semana)

module.exports = {
  linkedin, linkedinPromise
}
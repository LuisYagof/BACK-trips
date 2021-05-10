const axios = require('axios')
const cheerio = require('cheerio')

async function linkedin(kw) {
  const urlLinkedin = `https://www.linkedin.com/jobs/search?keywords=${kw}&location=Espa%C3%B1a&geoId=105646813&trk=public_jobs_jobs-search-bar_search-submit&f_TPR=r86400&position=1&pageNum=0`
  const htmlPage = await axios(urlLinkedin)
  const $ = cheerio.load(htmlPage.data);

  let numOf = []

  $('span.results-context-header__job-count').each(function () {
    numOf.push($(this).text().trim())
  });

  let num = Number(numOf)

  console.log(num);
  return Number(num)

}

linkedin("Laravel");

module.exports = {
  linkedin
}


// server.get('/linkedin/:kw', async (req, res) => {
//   try {
//       let linkedinRES = await linkedin(req.params.kw)
//       if (linkedinRES) {
//           res.status(200).json({
//               status: 200,
//               ok: true,
//               data: linkedinRES
//           })
//       } else {
//           res.status(400).json({
//               status: 200,
//               ok: false,
//               data: "MAL"
//           })
//       }
//   } catch {
//       res.status(500).json({
//           status: 200,
//           ok: false,
//           data: "FATAL"
//       })
//   }
// })
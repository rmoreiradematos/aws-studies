async function handler(event, context){
  console.log("Ambiente ... ", JSON.stringify(process.env, null, 2))
  console.log("Event ", JSON.stringify(event, null, 2))

  return {
    het: "jude"
  }
}

module.exports = { handler }
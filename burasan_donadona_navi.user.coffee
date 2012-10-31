
getCardNo = ->
  parseInt document.querySelectorAll('span.cardno')[0].textContent

getCardListPageUrl = (num)->
  subdomain = location.href.match(/http:\/\/([a-z][0-9]+)\.3gokushi\.jp/)[1]
  'http://' + subdomain + '.3gokushi.jp/card/trade.php?t=no&s=price&k=' + getCardNo()

getCardRate = ->
  xhr = new XMLHttpRequest()
  xhr.open('GET', getCardListPageUrl(), true)
  xhr.onreadystatechange = (response)->
    if xhr.readyState is 4
      html = response.target.response

      div = document.createElement('div')
      div.id = 'tmp'
      div.innerHTML = html
      div.style.display = 'none'
      document.body.appendChild div

      resultHtml = document.querySelector('#tmp').querySelectorAll('table.tradeTables')[0]

      document.querySelector('#gray02Wrapper').replaceChild(resultHtml,
        document.querySelector('#gray02Wrapper').lastChild)

  xhr.send(null)

main = ->
  getCardRate()

main()

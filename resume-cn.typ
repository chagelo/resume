#import "main.typ": *;
#show: chicv
#show text.where(weight: "bold"): it => {
  show regex("\p{script=Han}"): set text(stroke: 0.02857em)
  it
}
#runReader(Chinese) 

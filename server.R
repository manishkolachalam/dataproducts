mtcars<- read.csv("mtcars.csv")

data(mtcars)
final <- lm(qsec~ disp+wt+vs+carb, data = mtcars)

result <- function(a,b,c,d){
  disp <- a
  wt <- b
  vs <- c
  carb <- d
  x <- data.frame(disp,wt,vs,carb)
  p <- predict(final, x)
  print(p)
}

shinyServer(
  function(input, output) {
        output$qmile <- renderText(
          {result(input$a,input$b,input$c,input$d)})
  }
)

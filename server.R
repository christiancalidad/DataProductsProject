server<-function(input, output) {
  
  DatosDia <- DatosDia
  
  
  DatosDia$Fecha<-as.Date(DatosDia$Fecha,"%Y-%m-%d")
  SerieDia <- aggregate(Accidentes~Fecha*CLASE,data=DatosDia,FUN=sum)
  

  output$SerieDiaria <- renderPlotly({
    
    Base <- subset(SerieDia,subset = (Fecha>=input$Fecha1 & Fecha<=input$Fecha2 ))
    
    if(input$Periodo == "Diario"){
      SerieGraph <- aggregate(Accidentes~Fecha*CLASE,data=Base,FUN=sum)
      
    }
    if(input$Periodo == "Semanal"){
      SerieGraph <- aggregate(Accidentes~Fecha*CLASE,data=Base,FUN=sum)
      SerieGraph$Fecha <-format(SerieGraph$Fecha,"%G-%V")
      SerieGraph <- aggregate(Accidentes~Fecha*CLASE,data=SerieGraph,FUN=sum)
    }
    if(input$Periodo == "Mensual"){
      SerieGraph <- aggregate(Accidentes~Fecha*CLASE,data=Base,FUN=sum)
      SerieGraph$Fecha <-format(SerieGraph$Fecha,"%G-%m")
      SerieGraph <- aggregate(Accidentes~Fecha*CLASE,data=SerieGraph ,FUN=sum)
    }

      
      plot_ly (data=SerieGraph,
                       x = ~Fecha,
                       y = ~Accidentes,
                       split = ~CLASE,
                       type = "scatter" ,mode = "lines")
      

  })
  
}



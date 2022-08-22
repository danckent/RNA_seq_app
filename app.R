#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

ui <- basicPage(
    h2("RNA_seq_Count_Data_Kent"),
    DT::dataTableOutput("mytable")
)

server <- function(input, output) {
    output$mytable = DT::renderDataTable({
        RNA_seq_ALL_patients <- readRDS("/mnt/SE_hijack/txi_no_elminated.RDS")
        RNA_seq_ALL_patients$counts
    })
}

shinyApp(ui, server)

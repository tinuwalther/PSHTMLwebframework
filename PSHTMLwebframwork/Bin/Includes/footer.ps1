Footer {

    div -id "footer" -class "container-fluid" -Content {

        hr

        $PSHTMLlink = a {"PSHTML"} -href "https://github.com/Stephanevg/PSHTML"  
        p {
            "Generated with $($PSHTMLlink)"
        }
        
    }
    
}

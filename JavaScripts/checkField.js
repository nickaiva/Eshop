function butCheckForm_onclick()
{
   var myForm = document.form1;
   if (myForm.ID.value == "" )
   {
      alert("Please enter the product ID number!");
      
         myForm.ID.focus();
         window.location.reload();
      }
   else
      //alert("Please wait while fetching the details for product with ID number " + myForm.ID.value);
   return;   
}

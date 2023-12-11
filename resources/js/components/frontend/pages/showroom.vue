<template>
    <div class="">
        <section class="showroom">
            <div class="container">
                <h1 class="text-center mb-5 pb-5 border-bottom">Our Showroom </h1>
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-6">
                        <div class="showroom_left">
                            <h3> OUR ADDRESS :</h3>
                            <h6 class="border-top pt-5">House # 82, Block-F, Road # 5, Banani , Dhaka-1213 </h6>
                            <h6>Email:<span> info@sprezzaturabd.com</span></h6> 
                            <h6>Email:<span> sales@sprezzaturabd.com</span></h6>
                            <h3 class="pt-5 pb-3 border-bottom">OPENING HOUR: </h3>
                            <h6>Monday to Saturday 10:00 PM to 6:00 PM</h6>
                        </div>
                        <div class="follow">
                    <h4>Follow Us :</h4>
                   <a href="https://www.facebook.com/houseofsprezzaturabd"><i class="fa-brands fa-facebook"></i></a> 
                  <a href="https://www.instagram.com/houseofsprezzaturabd/"> <i class="fa-brands fa-instagram"></i></a> 
                  <a href="https://bd.linkedin.com/company/sprezzaturabd">    <i class="fa-brands fa-linkedin"></i></a> 
                  <a href="https://www.youtube.com/@houseofsprezzatura"> <i class="fa-brands fa-youtube"></i></a>
                </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="showroomimg">
                            <img :src="getUrl('public/img/showroom2.jpg')" alt="aboutimg" class="img-fluid rounded " />

                        </div>
                    </div>
                </div>

            </div>
        </section>
  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d260.0861683643233!2d90.40258038406786!3d23.788707587606165!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755c744625fc88d%3A0x5d14e0b74fbb8eb4!2sSprezzatura!5e1!3m2!1sen!2sbd!4v1700460043141!5m2!1sen!2sbd" width="600" height="450" style="border:0;" allowfullscreen="" loading="azy" referrerpolicy="no-referrer-when-downgrade"></iframe>
  </div>
  </template>
  <script>
  </script>
  
 <style scoped>
 .showroom{
    margin:50px;
 }
 .showroom_left h3{
    color: chocolate;
 }
 .showroom_left span{
    font-size: 14px;
    color: #5a5d5a;
 }
.showroomimg{
    overflow: hidden;
    border-radius: 30px;
}
.showroomimg img{
    display: block;
    transition: transform 250ms;
    border-radius: 30px;
}
.showroomimg img:hover{
    transform: scale(1.1);
   
}

.follow{
padding: 30px 0px;
}
.follow i{
    border: 2px solid #ed6d18;
    padding: 12px;
    margin-right: 10px;
    border-radius: 10px;
    margin-top: 20px;
    color:#Fff;
    background-color:#ed6d18;
}
.follow i:hover{
    background-color: #080f33;
    border: 2px solid #080f33;
   transition: 0.4s;
   cursor: pointer;
}
</style>
  
  
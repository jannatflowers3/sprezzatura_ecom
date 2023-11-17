<template>
<div class="sg-page-content" >
  <section class="aboutus">
    <div class="container">
        <div class="row justify-content-center ">
            <div class="col-lg-10">
                <div class="about_part">
                    <h3>About Us</h3>
                    <p>Sprezzatura an upscale clothing brand founded in 2020. currently operating in dhaka and working to reach the global market. our company culture promotes an open environment by being transparent, respectful and honest. we do quality work to offer high end products and we are customer committed.
    
                    </p>
                </div>
                <div class="follow">
                    <h4>Follow Us :</h4>
                    <i class="fa-brands fa-facebook"></i>
                    <i class="fa-brands fa-instagram"></i>
                    <i class="fa-brands fa-linkedin"></i>
                    <i class="fa-brands fa-youtube"></i>
                </div>
            </div>
            <div class="col-lg-6">
               <div class="aboutimg">
                <!-- <img src="zapierLogo" /> -->
                <!-- <img src="../../../../../public/images/image/Mirza-Faisal-Ahmed.jpeg" class="img-fluid" alt="team"> -->
                <!-- <img src="../../../../../public/images/image/mesurment.webp" alt="aboutimg" class="img-fluid">  -->
               </div>
            </div>

        </div>
    </div>
</section>
    <section class="our_team">
    <div class="container" v-if="lengthCounter(page)>0">
        <!-- <h1>{{page.title}}</h1>
        <div v-html="page.content"></div>
        <div class="teambg" :style="{ backgroundImage: 'url(' + teambg2 + ')' }"></div> -->
        
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="our_team text-center text-white">
                    <h2>Our Team</h2>
                <p>We Believe In Making Memories and Experiences That Matter</p>
                <img src="../../../../../public/images/image/Mirza-Faisal-Ahmed.jpeg" class="img-fluid" alt="">
                <h5>Mirza Faisal Ahmed</h5>
                <h6>Founder & CEO</h6>
                <div class="team_icon">
                <i class="fa-brands fa-facebook"></i>
                    <i class="fa-brands fa-instagram"></i>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
    </div>
</template>

<script>
import shimmer from "../partials/shimmer";
// import ceoimage from "./assets/images/homepage/Mirza-Faisal-Ahmed.jpeg";
import zapierLogo from '../../../../../public/images/image/Mirza-Faisal-Ahmed.jpeg'
export default {
    name: "about",
    components: {
        shimmer
    },
    data(){
      return {
          slug:this.$route.params.slug,
        //   teambg2: './assets/images/Mirza-Faisal-Ahmed.jpeg', // Replace with the path to your actual image
        //   teambg2: ' http://localhost/sprezzatura_ecom/public/images/Mirza-Faisal-Ahmed.jpeg?a1b3f19b74e8671380026f9b5cb55320',
        }
    },
    watch: {
        $route() {
            if(this.page.link != this.$route.params.slug){
                this.$store.dispatch('othersPage', this.$route.params.slug);
            }
        },
        page()
        {
            document.title = this.page.title;
        }
    },
    mounted(){
        if(this.page.link != this.$route.params.slug) {
            this.$store.dispatch('othersPage', this.slug);
        }
      document.title = this.page.title;

    },
   computed:{
       page() {
           return this.$store.getters.getPageData;
       },
       shimmer(){
           return this.$store.state.module.shimmer
       }
   }
}
</script>

<style >

.h2oclore{
    color:blue;
}
.aboutus{
    background-color:rgb(209 108 3);
    color: #fff;
    padding: 80px 0px;
}
.aboutus h3, .our_team h2{
font-size: 40px;
font-family: Open Sans;
}
.follow{
padding: 30px 0px;
}
.follow i{
    border: 2px solid #fff;
    padding: 12px;
    margin-right: 10px;
    border-radius: 10px;
    margin-top: 20px;
}
.follow i:hover{
    background-color: #080f33;
   transition: 0.4s;
   cursor: pointer;
}
.our_team{
    background-color: #080f33;
    padding:50px 0px;
}
.our_team h2{
    color: #ed6d18;
    font-weight: 700;
}
.our_team img{
    height: 300px;
    margin: 30px 0px;
}
.our_team p{
    margin-top: 20px;
}
.team_icon{

}
.team_icon i{
    border: 2px solid #fff;
    padding: 12px;
    margin-right: 10px;
    border-radius: 10px;
}
.team_icon i:hover{
    background-color: #ed6d18;
    border: 2px solid #ed6d18;
    cursor: pointer;
}

.teambg{
    /* background-image: url('../../../../../image/Mirza-Faisal-Ahmed.jpeg'); */
    background-size: cover;
    /* background-color: red; */
    min-height: 300px;
}
</style>

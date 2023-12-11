<template>
<div class="sg-page-content" >
  <section class="aboutus">
    <div class="container">
        <div class="row justify-content-center ">
            <div class="col-lg-6">
                <div class="about_part">
                    <h3>About Us</h3>
                    <p>Sprezzatura an upscale clothing brand founded in 2020. currently operating in dhaka and working to reach the global market. our company culture promotes an open environment by being transparent, respectful and honest. we do quality work to offer high end products and we are customer committed.
    
                    </p>
                </div>
                <div class="follow">
                    <h4>Follow Us :</h4>
                   <a href="https://www.facebook.com/houseofsprezzaturabd"><i class="fa-brands fa-facebook"></i></a> 
                  <a href="https://www.instagram.com/houseofsprezzaturabd/"> <i class="fa-brands fa-instagram"></i></a> 
                  <a href="https://bd.linkedin.com/company/sprezzaturabd">    <i class="fa-brands fa-linkedin"></i></a> 
                  <a href="https://www.youtube.com/@houseofsprezzatura"> <i class="fa-brands fa-youtube"></i></a>
                </div>
            </div>
            <div class="col-lg-6">
               <div class="aboutimg">
                <li v-if="settings.visa_pay_banner"></li>
                <img :src="getUrl('public/img/about_us.jpg')" alt="aboutimg" class="img-fluid  " />
            
               </div>
            </div>

        </div>
    </div>
</section>
    <section class="our_team">
    <div class="container" v-if="lengthCounter(page)>0">
        <div class="row ">
            <div class="col-lg-5">
                <div class="team">
                    <img :src="getUrl('public/img/Mirza-Faisal-Ahmed.jpeg')" alt="aboutimg" class="img-fluid " />
                </div>
             
            </div>
            <div class="col-lg-7">
                <div class="our_team_title  text-center text-white">
                    <!-- <h2>Our Team</h2> -->
                <p>We Believe In Making Memories and Experiences That Matter</p>
                <h2>Mirza Faisal Ahmed</h2>
                <h6>Founder & CEO</h6>
                <div class="team_icon">
                    <a href="https://www.facebook.com/houseofsprezzaturabd"><i class="fa-brands fa-facebook"></i></a> 
                  <a href="https://www.instagram.com/houseofsprezzaturabd/"> <i class="fa-brands fa-instagram"></i></a> 
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

export default {
    name: "about",
    components: {
        shimmer
    },
    data(){
      return {
          slug:this.$route.params.slug,
    
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

<style scoped>

.aboutus{
    padding: 80px 0px;
}
.aboutus h3{
font-size: 40px;
padding-bottom: 20px;
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
.our_team{
    background-color: #080f33;
    padding:80px 0px;
    margin-bottom: 120px;
    
}
.our_team_title{
    padding-top: 200px;
}
.our_team_title h2{
    color: #ed6d18;
    font-weight: 700;
}
.our_team_title h6{
    padding:10px 0px 20px;
}
.our_team_title h6{
    padding-top:10px;
}
.our_team_title p{
    margin-top: 20px;
}
.team_icon i{
    border: 2px solid #fff;
    padding: 12px;
    margin-right: 10px;
    border-radius: 10px;
    color: #fff;
}
.team_icon i:hover{
    background-color: #ed6d18;
    border: 2px solid #ed6d18;
    cursor: pointer;
}
.team, .aboutimg{
overflow: hidden;
}

.team img, .aboutimg img{
    display: block;
    transition: transform 250ms;
    border-radius: 10px;
}
.team img:hover, .aboutimg img:hover{
   
    transform: scale(1.1);
    border-radius: 20px;
}

</style>

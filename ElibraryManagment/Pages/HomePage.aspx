<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="ElibraryManagment.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

    <%-- causiol--%>
    <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="5" aria-label="Slide 6"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="6" aria-label="Slide 7"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="7" aria-label="Slide 8"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="8" aria-label="Slide 9"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="9" aria-label="Slide 10"></button>
            <button type="button" data-bs-target="#hero-carousel" data-bs-slide-to="10" aria-label="Slide 11"></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active c-item">

                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 1">
                <div class="carousel-caption top-0 mt-4">
                    <p class="mt-5 fs-3 text-uppercase">Text-uppercase fs-3 mt-5">Destination activities</p>
                 


                    <a class="btn btn-primary" href="#" role="button">Visit</a>
                </div>
            </div>


            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 2">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>


            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 3">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>

            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 4">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>


            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 5">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>


            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 6">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>

            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 7">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>

            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 8">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>

            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 9">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>

            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 10">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>

            <div class="carousel-item c-item">
                <img src="https://images.unsplash.com/photo-1612686635542-2244ed9f8ddc?fit=crop&w=2070&q=100" class="d-block w-100 c-img" width="400" height="800" alt="Slide 11">
                <div class="carousel-caption top-0 mt-4">
                    <p class="text-uppercase fs-3 mt-5">Destination activities</p>
                    <p class="display-1 fw-bolder text-capitalize">Go glacier hiking</p>
                    <button class="btn btn-primary px-4 py-2 fs-5 mt-5" data-bs-toggle="modal"
                        data-bs-target="#booking-modal">
                        Book a tour</button>
                </div>
            </div>





            <%-- ------------------%>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#hero-carousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#hero-carousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <br>
    <br>
    <br>


    <br>
    <br>
    <br>




    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>

                        <h2>Our Features</h2>
                        <p><b>Our 3 Primary Features -</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="../imgs/digital-inventory.png" />
                        <h4>Free training courses</h4>
                        <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="../imgs/search-online.png" />
                        <h4>Useful knowledge</h4>
                        <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="../imgs/defaulters-list.png" />
                        <h4>Defaulter List</h4>
                        <p class="text-justify">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor. reprehenderit</p>
                    </center>
                </div>
            </div>
        </div>

    </section>
    <section>

        <img src="../imgs/CCA%20Website%20Banner.jpg" width="1920" height="200" class="img-fluid" />
    </section>



    

    
   
    
</asp:Content>

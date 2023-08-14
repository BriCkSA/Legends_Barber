import { Component,OnInit } from '@angular/core';
import { BookingsService } from './bookings/booking-service.service';
import { NavigationEnd, Router } from '@angular/router';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Legends_Barbershop_Webapp';


bookings!: any[];

  constructor(private router: Router) { }

  ngOnInit() {
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd && this.router.navigated === false) {
        this.router.navigate(['/appointments']);
      }
    });
  }


  
}
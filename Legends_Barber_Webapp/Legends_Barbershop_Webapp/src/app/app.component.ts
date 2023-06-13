import { Component,OnInit } from '@angular/core';
import { BookingsService } from './booking-service.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Legends_Barbershop_Webapp';


bookings!: any[];

  constructor(private bookingsService: BookingsService) { }

  ngOnInit() {
    this.getBookings();
  }

  getBookings() {
    this.bookingsService.getBookings().subscribe(
      (data) => {
        this.bookings = data;
        console.log(this.bookings);
      },
      (error) => {
        console.error('Error fetching bookings:', error);
      }
    );
  }
}
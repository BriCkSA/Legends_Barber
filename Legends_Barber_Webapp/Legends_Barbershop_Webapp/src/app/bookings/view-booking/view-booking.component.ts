import { Component,OnInit } from '@angular/core';
import { BookingsService } from '../booking-service.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-view-booking',
  templateUrl: './view-booking.component.html',
  styleUrls: ['./view-booking.component.scss']
})
export class ViewBookingComponent implements OnInit {

  bookings!: any[];

  constructor(private bookingsService: BookingsService,private router: Router) { }

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

  goToBooking(): void {
    this.router.navigate(['/book']);
  }
}

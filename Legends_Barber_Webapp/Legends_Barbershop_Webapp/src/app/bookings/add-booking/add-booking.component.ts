import { Component, OnInit } from '@angular/core';
import { BookingsService } from '../booking-service.service';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';


@Component({
  selector: 'app-add-booking',
  templateUrl: './add-booking.component.html',
  styleUrls: ['./add-booking.component.scss']
})
export class AddBookingComponent implements OnInit {

  exists : boolean = false;
  constructor(private bookingsService: BookingsService,private router: Router) { }

  ngOnInit(): void {
  }

  GetClient(num : any){

    this.bookingsService.getClient(num).subscribe(
      (data) => {
      
        console.log(data);
        this.exists = true;
      },
      (error) => {
        console.error('Error fetching client:', error);
      }
    );
  }

}

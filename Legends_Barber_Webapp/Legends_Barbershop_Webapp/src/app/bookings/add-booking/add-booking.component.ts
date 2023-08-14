import { Component, OnInit } from '@angular/core';
import { BookingsService } from '../booking-service.service';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';


@Component({
  selector: 'app-add-booking',
  templateUrl: './add-booking.component.html',
  styleUrls: ['./add-booking.component.scss']
})
export class AddBookingComponent implements OnInit {

  exists : boolean = false;
  userForm!: FormGroup;
  constructor(private bookingsService: BookingsService,private router: Router,private fb: FormBuilder) { 

    this.userForm = this.fb.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      // Add more form controls here
    });
  }

  ngOnInit(): void {
  }

  GetClient(num : any){

    this.bookingsService.getClient(num).subscribe(
      (data) => {
      
        console.log(data['data']);
        var response = data['data'];

        this.userForm.setValue({
          firstName: response['name'],
          lastName: response['surname'],
          email: response['email']
        });
        this.exists = true;
      },
      (error) => {
        console.error('Error fetching client:', error);
      }
    );
  }

  submitForm() {
    if (this.userForm.valid) {
      // Process the form data here
    }
  }

}

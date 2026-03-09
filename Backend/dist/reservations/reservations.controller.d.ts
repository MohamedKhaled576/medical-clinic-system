import { ReservationService } from './reservations.service';
import { CreateReservationDto } from './dto/create-reservation.dto';
export declare class ReservationController {
    private readonly reservationService;
    constructor(reservationService: ReservationService);
    create(createReservationDto: CreateReservationDto): Promise<{
        createdAt: Date;
        updatedAt: Date;
        id: number;
        date: Date;
        patientId: number;
    }>;
    findAllByPatient(patientId: number): Promise<{
        createdAt: Date;
        updatedAt: Date;
        id: number;
        date: Date;
        patientId: number;
    }[]>;
}

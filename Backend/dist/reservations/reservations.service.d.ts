import { CreateReservationDto } from './dto/create-reservation.dto';
import { PrismaService } from '../prisma/prisma.service';
export declare class ReservationService {
    private prisma;
    constructor(prisma: PrismaService);
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

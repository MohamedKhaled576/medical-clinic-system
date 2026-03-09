import { UpdatePatientDto } from './dto/update-patient.dto';
import { PrismaService } from '../prisma/prisma.service';
import { CreatePatientDto } from './dto/create-patient.dto';
export declare class PatientService {
    private prisma;
    constructor(prisma: PrismaService);
    create(createPatientDto: CreatePatientDto): Promise<{
        name: string;
        createdAt: Date;
        updatedAt: Date;
        id: number;
        phonenumber: string;
        phonenumber2: string | null;
        locationaddress: string;
    }>;
    findAll(): Promise<({
        reservations: {
            createdAt: Date;
            updatedAt: Date;
            id: number;
            date: Date;
            patientId: number;
        }[];
    } & {
        name: string;
        createdAt: Date;
        updatedAt: Date;
        id: number;
        phonenumber: string;
        phonenumber2: string | null;
        locationaddress: string;
    })[]>;
    findOne(id: number): Promise<{
        reservations: {
            createdAt: Date;
            updatedAt: Date;
            id: number;
            date: Date;
            patientId: number;
        }[];
    } & {
        name: string;
        createdAt: Date;
        updatedAt: Date;
        id: number;
        phonenumber: string;
        phonenumber2: string | null;
        locationaddress: string;
    }>;
    update(id: number, updatePatientDto: UpdatePatientDto): Promise<{
        name: string;
        createdAt: Date;
        updatedAt: Date;
        id: number;
        phonenumber: string;
        phonenumber2: string | null;
        locationaddress: string;
    }>;
    remove(id: number): Promise<{
        name: string;
        createdAt: Date;
        updatedAt: Date;
        id: number;
        phonenumber: string;
        phonenumber2: string | null;
        locationaddress: string;
    }>;
}

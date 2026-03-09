import { PatientService } from './patients.service';
import { CreatePatientDto } from './dto/create-patient.dto';
import { UpdatePatientDto } from './dto/update-patient.dto';
export declare class PatientController {
    private readonly patientService;
    constructor(patientService: PatientService);
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

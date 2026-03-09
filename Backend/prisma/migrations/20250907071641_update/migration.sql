-- CreateTable
CREATE TABLE "public"."User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "idnumber" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Patient" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "PhoneNumber" TEXT NOT NULL,
    "PhoneNumber2" TEXT NOT NULL,
    "LocationAddress" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Material" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "PartNumber" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Material_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_idnumber_key" ON "public"."User"("idnumber");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_PhoneNumber_key" ON "public"."Patient"("PhoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_PhoneNumber2_key" ON "public"."Patient"("PhoneNumber2");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_LocationAddress_key" ON "public"."Patient"("LocationAddress");

-- CreateIndex
CREATE UNIQUE INDEX "Material_PartNumber_key" ON "public"."Material"("PartNumber");

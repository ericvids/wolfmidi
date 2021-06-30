#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <memory>

int main(int c, char *argv[])
{
    if (c > 2)
    {
        FILE *pInFile = fopen(argv[1], "rb");
        if (pInFile)
        {
            fseek(pInFile, 0L, SEEK_END);
            unsigned int size = ftell(pInFile);
            rewind(pInFile);
            std::unique_ptr<unsigned char []> pBuffer(new unsigned char[size]);
            unsigned char *buffer = pBuffer.get();
            fread(buffer, size, 1, pInFile);
            fclose(pInFile);

            size_t p = 8;
            while (p < size
                   && (buffer[p - 8] != '!'
                       || buffer[p - 7] != 'I'
                       || buffer[p - 6] != 'D'
                       || buffer[p - 5] != '!'
                       || buffer[p - 4] != '!'
                       || buffer[p - 3] != 'I'
                       || buffer[p - 2] != 'D'
                       || buffer[p - 1] != '!'))
            {
                p++;
            }

            while (p < size)
            {
                printf("%04x %02x %02x ", p, buffer[p], buffer[p + 1]);
                size_t nextSize = buffer[p] + buffer[p + 1] * 256 + 2;
                p += nextSize;
                p += 88;

                char sz[256];
                strcpy(sz, argv[2]);
                sz[strlen(sz) + 1] = 0;
                sz[strlen(sz)] = '\\';
                strcpy(&sz[strlen(sz)], (const char *) &buffer[p - 88 + 2]);
                sz[strlen(sz) + 4] = 0;
                sz[strlen(sz) + 3] = 'F';
                sz[strlen(sz) + 2] = 'L';
                sz[strlen(sz) + 1] = 'W';
                sz[strlen(sz)] = '.';
                printf("%s\n", sz);
                FILE *pOutFile = fopen(sz, "wb");
                if (pOutFile)
                {
                    fwrite(&buffer[p - 88 - nextSize], nextSize, 1, pOutFile);
                    fclose(pOutFile);
                }
            }

        }
        fclose(pInFile);
    }

    return 0;
}
